# Directions

Wraps the Google Directions API, takes the returned hash and gives it dot notation like behavior.  For simplicity, assuming the 
directions return one route and one leg, as I have yet to see it return more.

The API and the arguments that can be passed are available here, as well as terms of use.
https://developers.google.com/maps/documentation/directions/


Thanks to George Lantz for the code to decode the google polylines into coordinates.

## Installation

Add this line to your application's Gemfile:

    gem 'directions'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install directions

## Usage


	irb(main):002:0> directions = Directions::Router.directions(:origin => "111 8th Ave, NYC", :destination => "55 Broad St, NYC",:mode => "walking")

	irb(main):004:0> directions.start_address
	=> "111 8th Ave, New York, NY 10011, USA"

	irb(main):005:0> directions.end_address
	=> "55 Broad St, New York, NY 10005, USA"

	irb(main):006:0> directions.distance
	=> {"text"=>"2.7 mi", "value"=>4378}

# Distance in meters
	irb(main):007:0> directions.distance.value
	=> 4378

# Distance in text
	irb(main):007:0> directions.distance.text
	=> 4378

# Steps as a hash.
	irb(main):011:0> pp directions.steps
	[{"duration"=>{"text"=>"7 mins", "value"=>400},
	  "travel_mode"=>"WALKING",
	  "distance"=>{"text"=>"0.3 mi", "value"=>536},
	  "polyline"=>{"points"=>"wdtwFdntbM~@l@hCbBdAt@`A|@|@dAjAvAp@x@rB`C~BrC"},
	  "html_instructions"=>
	   "Head <b>southwest</b> on <b>8th Ave</b> toward <b>W 15th St</b>",
	  "start_location"=>{"lat"=>40.74076, "lng"=>-74.00179},
	  "end_location"=>{"lat"=>40.73691, "lng"=>-74.00557}},
	 {"duration"=>{"text"=>"30 mins", "value"=>1772},
	  "travel_mode"=>"WALKING",
	  "distance"=>{"text"=>"1.5 mi", "value"=>2403},
	  "polyline"=>
	   {"points"=>
	     "ulswFxeubMd@`@PLTFv@HnAJlCThCTjCTbCT`CTtAL`AHnCRnCVpCVtC^pCRhCPpCRzC`@N@pBPzBVjBR^FPDT@XDXBZ?zBL`CXJ@vBPdCTP@zBVbC^x@HfALnAH~@LdAJ~@JdAJnCN~BN"},
	  "html_instructions"=>"Continue onto <b>Hudson St</b>",
	  "start_location"=>{"lat"=>40.73691, "lng"=>-74.00557},
	  "end_location"=>{"lat"=>40.71553, "lng"=>-74.00932}},
	 {"duration"=>{"text"=>"2 mins", "value"=>110},
	  "travel_mode"=>"WALKING",
	  "distance"=>{"text"=>"440 ft", "value"=>134},
	  "polyline"=>{"points"=>"agowFf}ubMBKzBaG"},
	  "html_instructions"=>"Turn <b>left</b> onto <b>Chambers St</b>",
	  "start_location"=>{"lat"=>40.71553, "lng"=>-74.00932},
	  "end_location"=>{"lat"=>40.71489, "lng"=>-74.00797}},
	 {"duration"=>{"text"=>"7 mins", "value"=>427},
	  "travel_mode"=>"WALKING",
	  "distance"=>{"text"=>"0.4 mi", "value"=>574},
	  "polyline"=>{"points"=>"acowFxtubMpBxAnBvAlBtAfBpAnBrAHDnB|@hBjA|BjA"},
	  "html_instructions"=>"Turn <b>right</b> onto <b>Church St</b>",
	  "start_location"=>{"lat"=>40.71489, "lng"=>-74.00797},
	  "end_location"=>{"lat"=>40.71036, "lng"=>-74.01122}},
	 {"duration"=>{"text"=>"2 mins", "value"=>100},
	  "travel_mode"=>"WALKING",
	  "distance"=>{"text"=>"397 ft", "value"=>121},
	  "polyline"=>{"points"=>"wfnwFbivbMtBoF"},
	  "html_instructions"=>"Turn <b>left</b> onto <b>Cortlandt St</b>",
	  "start_location"=>{"lat"=>40.71036, "lng"=>-74.01122},
	  "end_location"=>{"lat"=>40.70977, "lng"=>-74.01002}},
	 {"duration"=>{"text"=>"3 mins", "value"=>195},
	  "travel_mode"=>"WALKING",
	  "distance"=>{"text"=>"0.2 mi", "value"=>268},
	  "polyline"=>{"points"=>"acnwFravbMdCnBv@x@r@n@n@f@pBrA"},
	  "html_instructions"=>"Turn <b>right</b> onto <b>Broadway</b>",
	  "start_location"=>{"lat"=>40.70977, "lng"=>-74.01002},
	  "end_location"=>{"lat"=>40.70775, "lng"=>-74.01173}},
	 {"duration"=>{"text"=>"1 min", "value"=>80},
	  "travel_mode"=>"WALKING",
	  "distance"=>{"text"=>"358 ft", "value"=>109},
	  "polyline"=>{"points"=>"mvmwFhlvbMp@{AdAoB"},
	  "html_instructions"=>"Turn <b>left</b> onto <b>Wall St</b>",
	  "start_location"=>{"lat"=>40.70775, "lng"=>-74.01173},
	  "end_location"=>{"lat"=>40.70715, "lng"=>-74.01071}},
	 {"duration"=>{"text"=>"3 mins", "value"=>155},
	  "travel_mode"=>"WALKING",
	  "distance"=>{"text"=>"0.1 mi", "value"=>233},
	  "polyline"=>{"points"=>"urmwF|evbMvDhBn@XNDP@`CX"},
	  "html_instructions"=>
	   "Turn <b>right</b> onto <b>Broad St</b><div style=\"font-size:0.9em\">Destination will be on the left</div>",
	  "start_location"=>{"lat"=>40.70715, "lng"=>-74.01071},
	  "end_location"=>{"lat"=>40.70517, "lng"=>-74.01154}}]
	=> nil

# Hashes will act like objects, so you can use dot notation to access the html_instructions from the first step
	irb(main):014:0> directions.steps.first.html_instructions
	=> "Head <b>southwest</b> on <b>8th Ave</b> toward <b>W 15th St</b>"

# Want an array of coordinate pairs to represent the path of the directions?

	irb(main):015:0> directions.coordinate_paths
	=> [[40.74076, -74.00179], [40.73975, -74.00252], [40.7394, -74.00279], [40.73907, -74.0031], [40.73838, -74.00389], [40.73755, -74.00483], [40.73691, -74.00557], [40.73672, -74.00574], [40.73663, -74.00581], [40.73652, -74.00585], [40.73584, -74.00596], [40.73444, -74.00618], [40.732, -74.00658], [40.73095, -74.00673], [40.7295, -74.00697], [40.72875, -74.00713], [40.72802, -74.00723], [40.7266, -74.00742], [40.72574, -74.0076], [40.72455, -74.00781], [40.72365, -74.00799], [40.72339, -74.00804], [40.72263, -74.00811], [40.72192, -74.00825], [40.72065, -74.00845], [40.71994, -74.00858], [40.71899, -74.00879], [40.71823, -74.00891], [40.71756, -74.00904], [40.71689, -74.00916], [40.71553, -74.00932], [40.71489, -74.00797], [40.71376, -74.00886], [40.71269, -74.0097], [40.71208, -74.01015], [40.71152, -74.01046], [40.71099, -74.01084], [40.71036, -74.01122], [40.70977, -74.01002], [40.7091, -74.01058], [40.70882, -74.01087], [40.70832, -74.01131], [40.70775, -74.01173], [40.7075, -74.01127], [40.70715, -74.01071], [40.70623, -74.01124], [40.70591, -74.0114], [40.70517, -74.01154]]


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
