foo 'bar' do
# query
  query <<-SQL
    SELECT
      something
    FROM
      world
    WHERE
      hello = 'world'
  SQL
end
