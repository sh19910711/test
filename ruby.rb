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

foo 'html' do
  html <<-HTML
    <!doctype html>
    <html>
      <head>
        <title>Hello</title>
      </head>
      <body>
        <h1>Hello</h1>
      </body>
    </html>
  HTML
end
