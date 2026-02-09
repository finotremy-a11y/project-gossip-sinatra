require 'bundler'
Bundler.require

require 'sinatra'
require 'sinatra/base'

$:.unshift File.expand_path("./../lib", __FILE__)
require 'gossip'
require 'controller'

run ApplicationController
