# encoding: utf-8
#
# codeforces.rb
#
# Copyright (c) 2013-2014 Hiroyuki Sano <sh19910711 at gmail.com>
# Licensed under the MIT-License.
#

require 'contest/driver/common'

module Contest
  module Driver
    class CodeforcesDriver < DriverBase
      def initialize_ext
        @client = Mechanize.new {|agent|
          agent.user_agent_alias = 'Windows IE 7'
        }
      end

      def get_opts_ext
        define_options do
          opt(
            :contest_id,
            "Contest ID (Ex: 100, 234, etc...)",
            :type => :string,
            :required => true,
          )
          opt(
            :problem_id,
            "Problem ID (Ex: A, B, etc...)",
            :type => :string,
            :required => true,
          )
        end
      end

      def get_site_name
        "Codeforces"
      end

      def get_problem_id(options)
        "#{options[:contest_id]}#{options[:problem_id]}"
      end

      def get_desc
        "Codeforces (URL: http://codeforces.com/)"
      end

      def resolve_language(label)
        case label
        when "clang"
          return "10"
        when "cpp"
          return "1"
        when "cpp11"
          return "16"
        when "cs"
          return "9"
        when "dlang"
          return "28"
        when "golang"
          return "32"
        when "haskell"
          return "12"
        when "java"
          return "23"
        when "ocaml"
          return "19"
        when "delphi"
          return "3"
        when "pascal"
          return "4"
        when "perl"
          return "13"
        when "php"
          return "6"
        when "python2"
          return "7"
        when "python3"
          return "31"
        when "ruby"
          return "8"
        when "scala"
          return "20"
        else
          abort "unknown languag"
        end
      end

      def submit_ext()
        # start
        trigger 'start'
        contest_id = @options[:contest_id]
        problem_id = @options[:problem_id]

        # login
        trigger 'before_login'
        login_page = @client.get 'http://codeforces.com/enter'
        puts "#DEBUG: login_page = #{login_page.uri}" if debug?
        login_page.form_with(:action => '') do |form|
          form.handle = @config["user"]
          form.password = @config["password"]
        end.submit
        trigger 'after_login'

        # submit
        trigger 'before_submit', @options
        # retry once
        retries = 1
        begin
          submit_page = @client.get "http://codeforces.com/contest/#{contest_id}/submit"
          puts "#DEBUG: submit_page = #{submit_page.uri}" if debug?
          res_page = submit_page.form_with(:class => 'submit-form') do |form|
            form.submittedProblemIndex = problem_id
            form.programTypeId = @options[:language]
            form.source = File.read(@options[:source])
          end.submit
          puts "#DEBUG: result_page = #{res_page.uri}" if debug?
        rescue => e
          raise if retries == 0
          retries -= 1
          # may not be registered practice
          if /submittedProblemIndex/ =~ e.to_s
            contest_page = @client.get "http://codeforces.com/contest/#{contest_id}"
            contest_page.form_with(:action => "") do |form|
              flag_need_to_register = false
              form.field_with(:value => "registerForPractice") do |field|
                flag_need_to_register = true
              end
              form.click_button if flag_need_to_register
            end
            sleep 3
            retry
          end
          raise
        end
        trigger 'after_submit'

        if error_msg = parse_error(res_page.body)
          puts "### ERROR ###"
          puts error_msg
          puts ""
          exit 1
        end
        # need to get the newest waiting submissionId
        submission_id = get_submission_id(res_page.body)
        trigger(
          'before_wait',
          {
            :submission_id => submission_id,
          }
        )

        # wait result
        status = get_status_wait(contest_id, submission_id)
        trigger(
          'after_wait',
          {
            :submission_id => submission_id,
            :status => status,
            :result => get_commit_message(status),
          }
        )

        trigger 'finish'
        get_commit_message(status)
      end

      private

      def parse_error(body)
        doc = Nokogiri::HTML(body)
        doc.xpath('//span[contains(@class, "error for__")]').map do |e|
          e.text.gsub(/ /, " ").strip
        end.find do |text|
          not text.empty?
        end
      end

      def get_status_wait(contest_id, submission_id)
        contest_id = contest_id.to_s
        submission_id = submission_id.to_s
        # wait result
        5.times do
          sleep 3
          my_page = @client.get "http://codeforces.com/contest/#{contest_id}/my"
          status = get_status(submission_id, my_page.body)
          return status unless is_waiting(submission_id, my_page.body)
          trigger 'retry'
        end
        trigger 'timeout'
        return 'timeout'
      end

      def is_waiting(submission_id, body)
        doc = Nokogiri::HTML(body)
        element = doc.xpath('//td[@submissionid="' + submission_id + '"]')[0]
        element["waiting"] == "true"
      end

      def get_status(submission_id, body)
        doc = Nokogiri::HTML(body)
        element = doc.xpath('//td[@submissionid="' + submission_id + '"]')[0]
        element.text().strip
      end

      def get_submission_id(body)
        doc = Nokogiri::HTML(body)
        # get first td.status-cell
        line = doc.xpath('//td/a[contains(./text() , "' + @config["user"] + '")]').xpath('../..')[0]
        elements = line.xpath('//td[contains(concat(" ",@class," "), " status-cell ")]')
        elements[0].attributes()["submissionid"].value.strip
      end
    end
  end
end
