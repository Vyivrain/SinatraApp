require 'json/ext'
require 'mongoid'
require 'sinatra'
require 'pry'
require './models/app_model'


get '/' do
	@statistics = Info.all
	erb :root, layout: :home
end

get '/memory' do
	@statistic = Info.save_system_data( params[:title], params[:date], params[:info0], params[:info1], params[:info2], params[:info3] )
	puts params
    arMem = parseStr(`free -m`)
    erb :memory, layout: :home, locals: { arMem: arMem }
end

get '/disk' do 
	puts params
	@statistic = Info.save_system_data( params[:title], params[:date], params[:info0], params[:info1], params[:info2], params[:info3], params[:info4],
		params[:info5], params[:info6], params[:info7], params[:info8] )
	puts params
	fileArr = parseStr(`df -h`)
	erb :disk, layout: :home, locals: { fileArr: fileArr }
end

def parseStr(str)
 	str.lines
end