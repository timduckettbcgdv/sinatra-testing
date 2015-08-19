# Generated by cucumber-sinatra. (2015-08-17 11:00:44 +0200)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/sample_app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'json_spec/cucumber'

Capybara.app = SampleApp

class SampleAppWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  SampleAppWorld.new
end

def last_json
  page.source
end