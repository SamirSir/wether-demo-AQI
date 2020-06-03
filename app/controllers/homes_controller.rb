class HomesController < ApplicationController
  def index
	require 'net/http'
	require 'json'

	@url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=89129&distance=0&API_KEY=5700132B-7786-4D65-A883-B82E7E7FB608'
	@uri = URI(@url)
	@response = Net::HTTP.get(@uri)
	@output = JSON.parse(@response) 	

	# output emptyness validation
	if @output.empty?
		@final_output = "Error"

	elsif !@output
		@final_output = "Error"
	else
		@final_output = @output[0]['AQI']
	end	

	# color assignment
	
	if @final_output == "Error"
		@api_color = "grey"
	elsif @final_output <= 50
		@api_color = "green"
	elsif @final_output >= 50 && @final_output<= 100
		@api_color = "yellow"
	elsif @final_output >= 101 && @final_output<= 150
		@api_color = "orange"
	elsif @final_output >= 151 && @final_output<= 200
		@api_color = "red"
	elsif @final_output >= 201 && @final_output<= 300
		@api_color = "purple"
	elsif @final_output >= 301 && @final_output<= 500
		@api_color = "maroon"

	end	


  end

end
