#!/usr/bin/env ruby

# Obtain the run steps
# curl -H 'Authroization: Bearer 3c1b3efd37a371c9a181aed868b6edfb04791585380b14e973aef036251d9137' https://app.wercker.com/api/v3/runs/58d102334b67450100fd8de3/steps
# Iterate each step and extract the log, then post it to sumologic collector
#

require 'httparty'
require 'json'

puts ENV['WERCKER_TOKEN']
puts ENV['WERCKER_RUN_URL']
puts ENV['SUMOLOGIC_COLLECTOR_URL']

token = ENV['WERCKER_TOKEN']

run_api_endpoint = 'https://app.wercker.com/api/v3/runs/'
run_id = ENV['WERCKER_RUN_URL'].split('/').pop()
run_endpoint = run_api_endpoint+run_id

headers = {"Authorization" => "Bearer #{token}"}
sumologic_collector_url = ENV['SUMOLOGIC_COLLECTOR_URL']

response = HTTParty.get("#{run_endpoint}/steps", headers: headers)
response_json = JSON.parse(response.body)

for step in response_json
  log_url = step["logUrl"]
  log_response = HTTParty.get(log_url, headers: headers)
  log_data = log_response.body
  step["logContent"] = log_data

  sumologic_post_response = HTTParty.post(sumologic_collector_url,
    :body => step.to_json,
    :headers => { 'Content-Type' => 'application/json' } )

end
