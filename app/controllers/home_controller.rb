class HomeController < ApplicationController
  def index
require 'net/http'
require 'json'

   @url ='https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20002&distance=25&API_KEY=YOUR API KEY HERE'
  @uri = URI(@url)
  @response = Net::HTTP.get(@uri)
@output = JSON.parse(@response)
#check for error in api response
if @output.empty?
  @final_output = "Error"
else
  @final_output= @output[0]['AQI']
end
if @final_output == "Error"
  @api_colour = "gray"
  @message = "somethings wrong"
elsif @final_output <= 50
  @api_colour = "green"
  @message = "real good"
elsif @final_output >=51 && @final_output <= 100
  @api_colour = "yellow"
  @message = "not bad"
elsif @final_output >=101 && @final_output <= 150
  @api_colour = "orange"
  @message = "pretty bad"
elsif @final_output >=151 && @final_output <= 200
  @api_colour = "red"
  @message = "getting crapper"
elsif @final_output >=201 && @final_output <= 300
  @api_colour = "purple"
  @message = "bad real bad"
elsif @final_output >=301 && @final_output <= 500
  @api_colour = "maroon"
  @message = "best part of toxic"

end

end

def zipcode

  @searchresult = params[:zipcode]

  
  #do api stuff

  require 'net/http'
require 'json'

   @url ='https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode='+@searchresult+'&distance=25&API_KEY=A625BAF1-64B8-4E9A-85D7-A8B787DF63EF'
  @uri = URI(@url)
  @response = Net::HTTP.get(@uri)
@output = JSON.parse(@response)

#check for error in api response
if @output.empty?
  @final_output = "Error"
  @city = "Error"
else
  @final_output= @output[0]['AQI']
  @city=@output[0]['ReportingArea']
end
if @final_output == "Error"
  @api_colour = "gray"
  @message = "somethings wrong"
elsif @final_output <= 50
  @api_colour = "green"
  @message = "real good"
elsif @final_output >=51 && @final_output <= 100
  @api_colour = "yellow"
  @message = "not bad"
elsif @final_output >=101 && @final_output <= 150
  @api_colour = "orange"
  @message = "pretty bad"
elsif @final_output >=151 && @final_output <= 200
  @api_colour = "red"
  @message = "getting crapper"
elsif @final_output >=201 && @final_output <= 300
  @api_colour = "purple"
  @message = "bad real bad"
elsif @final_output >=301 && @final_output <= 500
  @api_colour = "maroon"
  @message = "best part of toxic"

end




  end

end

