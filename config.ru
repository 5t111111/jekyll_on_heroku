require 'rack'
require 'rack/contrib/try_static'

# Build static files when booting
`bundle exec rake site:generate`

use Rack::TryStatic, 
    :root => '_site',
    :urls => %w[/],
    :try => ['.html', 'index.html', '/index.html']

# otherwise 404 NotFound
run proc { [404, { 'Content-Type' => 'text/html' }, [File.read(File.expand_path("../_site/404/index.html", __FILE__))]] }
