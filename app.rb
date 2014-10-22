require 'sinatra'


get '/' do
	erb :root, layout: :home
end

get '/memory' do
    arMem = parseStr(`free -m`)
    erb :memory, layout: :home, locals: { arMem: arMem }
end

get '/disk' do 
	fileArr = parseStr(`df -h`)
	erb :disk, layout: :home, locals: { fileArr: fileArr }
end

def parseStr(str)
 	str.lines
end