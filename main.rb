# Set environment
ENV['RACK_ENV'] ||= 'production'

require 'sinatra'
require 'sinatra/config_file'
require 'yaml'
require 'json-schema'
<<<<<<< HEAD
<<<<<<< HEAD
#require 'logstash-logger'
=======
require 'open-uri'
>>>>>>> 93c42751e7b31e9216df6cb757ba1ab7f42afa57
=======
require 'open-uri'
>>>>>>> 93c42751e7b31e9216df6cb757ba1ab7f42afa57

# Require the bundler gem and then call Bundler.require to load in all gems
# listed in Gemfile.
require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require_relative 'models/init'
require_relative 'routes/init'
require_relative 'helpers/init'

configure do
	# Configuration for logging
	enable :logging
	Dir.mkdir("#{settings.root}/log") unless File.exists?("#{settings.root}/log")
	log_file = File.new("#{settings.root}/log/#{settings.environment}.log", "a+")
	log_file.sync = true
	use Rack::CommonLogger, log_file
end

before do
	logger.level = Logger::DEBUG
end

class SonataNsRepository < Sinatra::Application
	register Sinatra::ConfigFile
	# Load configurations
	config_file 'config/config.yml'
	Mongoid.load!('config/mongoid.yml')
end


class SonataVnfRepository < Sinatra::Application
	register Sinatra::ConfigFile
	# Load configurations
	config_file 'config/config.yml'
	Mongoid.load!('config/mongoid.yml')
end

class SonataCatalogue < Sinatra::Application
	register Sinatra::ConfigFile
	# Load configurations
	config_file 'config/config.yml'
	Mongoid.load!('config/mongoid.yml')
	#use Rack::CommonLogger, LogStashLogger.new(host: settings.logstash_host, port: settings.logstash_port)
end