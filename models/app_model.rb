require 'mongoid'
require './config/config'

class Info
	include Mongoid::Document
	field :title, type: String
	field :date, type: Date
	field :info, type: String

	def self.save_system_data( title, date, *info )
		if title.present?
			info_str = info.join("\n")
			a = Info.new( title: title, date: date, info: info_str )
			a.save
		end
	end

end