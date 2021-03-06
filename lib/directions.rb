require 'rubygems'
require File.expand_path(File.join(File.dirname(__FILE__), "directions", "version"))
require File.expand_path(File.join(File.dirname(__FILE__), "polyline_decoder"))
require File.expand_path(File.join(File.dirname(__FILE__), "extensions", "hash"))
require 'faraday'
require 'json'
module Directions
	class Router
		def self.directions(options = {})
			options[:sensor] ||= false
			origin = options[:origin]
			destination = options [:destination]
			if not origin && destination
				raise ArgumentError, "A hash containing origin and destination keys must be specified"
			end
			conn = Faraday.new(:url => 'http://maps.googleapis.com/')
			response = conn.get '/maps/api/directions/json', options
			return Result.new(JSON.parse(response.body))
		end
	end

	class Result
		def initialize(params)
			@attributes = params.routes.first
		end
		def method_missing(meth)
			if @attributes
				@attributes.send(meth)
			end
		end
		def coordinate_path
			if overview_polyline
				PolylineDecoder.decode(overview_polyline.points)
			end
		end
		def start_address
			legs.first.start_address
		end
		def end_address
			legs.first.end_address
		end
		def start_location
			legs.first.start_location
		end
		def end_location
			legs.first.end_location
		end		
		def distance
			legs.first.distance
		end
		def duration
			legs.first.duration
		end
		def steps
			return legs.first.steps
		end
	end
end
