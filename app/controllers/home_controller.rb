 class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=89129&distance=0&API_KEY=B216E8FC-0AD9-4BEF-B411-CC4BC3E8A50C' 
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)


      #Error checking for empty output
      if @output.empty?
        @final_output = "Output Error"
      else
        @final_output = @output[0]['AQI']
      end

    if @final_output == "Error"
      @api_color = "red"
    elsif @final_output <= 50
      @api_color = "green"
      @api_description = "This number is considered good"
    elsif @final_output >= 51 && @final_output <=100
      @api_color = "yellow"
      @api_description = "This number is considered moderate"
    elsif @final_output >= 101 && @final_output <=150
      @api_color = "orange"
      @api_description = "This number is considered unhealthy for Sensitive Groups (USG)"
    elsif @final_output >= 151 && @final_output <=200
      @api_color = "red"
      @api_description = "This number is considered unhealthy"
    elsif @final_output >= 201 && @final_output <=300
      @api_color = "purple"
      @api_description = "This number is considered very unhealthy"
    elsif @final_output >= 301 && @final_output <=500
      @api_color = "maroon"
      @api_description = "This number is considered hazardous"
      end   
  end
  
  def zipcode
    @zip_query = params[:zipcode]

    if params[:zipcode] == ""
      @zip_query = "Please enter a valid zipcode"
    elsif params[:zipcode]

      require 'net/http'
      require 'json'
      @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=' + @zip_query.to_s + '&distance=0&API_KEY=B216E8FC-0AD9-4BEF-B411-CC4BC3E8A50C' 
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)


          #Error checking for empty output
          if @output.empty?
        @final_output = "Output Error"
      else
        @final_output = @output[0]['AQI']
      end

    if @final_output == "Error"
      @api_color = "red"
    elsif @final_output <= 50
      @api_color = "green"
      @api_description = "This number is considered good"
    elsif @final_output >= 51 && @final_output <=100
      @api_color = "yellow"
      @api_description = "This number is considered moderate"
    elsif @final_output >= 101 && @final_output <=150
      @api_color = "orange"
      @api_description = "This number is considered unhealthy for Sensitive Groups (USG)"
    elsif @final_output >= 151 && @final_output <=200
      @api_color = "red"
      @api_description = "This number is considered unhealthy"
    elsif @final_output >= 201 && @final_output <=300
      @api_color = "purple"
      @api_description = "This number is considered very unhealthy"
    elsif @final_output >= 301 && @final_output <=500
      @api_color = "maroon"
      @api_description = "This number is considered hazardous"
      end 
    end
  end
end