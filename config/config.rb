require 'sinatra'
require 'mongoid'
require 'json/ext' # required for .to_json


configure do
  Mongoid.load!("./mongoid.yml")
end