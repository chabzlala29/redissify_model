require "redissify_model"
require "sequel"

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |c|
  c.raise_errors_for_deprecations!
end
