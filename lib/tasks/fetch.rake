require 'open-uri'

require 'date'

namespace :fetch do
  desc "Fetches results from the QPX API"
  task api: :environment do

    url = Rails.root.join('lib', 'assets', 'qpx.json')
    # to be replaced by the API once we figure it out

    results = JSON.parse(open(url).read)

    # puts results["kind"].class
    # puts results["trips"].keys

    # pp results["trips"]["tripOption"]["kind".to_i]["slice"].count

    to_flight = results["trips"]["tripOption"][0]["slice"][0]["segment"][0]
    from_flight = results["trips"]["tripOption"][0]["slice"][1]["segment"][0]
    price = results["trips"]["tripOption"][0]["saleTotal"].delete("USD")

    # puts to_flight.inspect
    # puts
    # puts from_flight.inspect
    # puts
    # puts price

    r_departure_time = to_flight["leg"][0]["departureTime"]
    date = DateTime.parse(r_departure_time)
    f_departure_time = date.strftime('%H:%M:%S %:z')

    # puts f_departure_time

    r_departure_time_return = from_flight["leg"][0]["departureTime"]
    date = DateTime.parse(r_departure_time_return)
    f_departure_time_return = date.strftime('%H:%M:%S %:z')

    # puts f_departure_time_return

    s = Search.new
    s.carrier = to_flight["flight"]["carrier"]
    s.flight_no = to_flight["flight"]["number"]
    s.origin = to_flight["leg"][0]["origin"]
    s.destination = to_flight["leg"][0]["destination"]
    s.duration = to_flight["leg"][0]["duration"]
    s.departure_time = f_departure_time

    s.carrier_return = from_flight["flight"]["carrier"]
    s.flight_no_return = from_flight["flight"]["number"]
    s.origin_return = from_flight["leg"][0]["origin"]
    s.destination_return = from_flight["leg"][0]["destination"]
    s.duration_return = from_flight["leg"][0]["duration"]
    s.departure_return_time = f_departure_time_return

    s.price = price.to_f

    s.save

    puts "#{s.carrier} No. #{s.flight_no} from #{s.origin} to #{s.destination} for #{s.price} saved"



    # class Partay
    #   include HTTParty
    # end

#     options = {
#   "request": {
#     "slice": [
#       {
#         "origin": "ORD",
#         "destination": "JFK",
#         "date": "2015-06-10"
#       }
#     ],
#     "passengers": {
#       "adultCount": 1,
#       "infantInLapCount": 0,
#       "infantInSeatCount": 0,
#       "childCount": 0,
#       "seniorCount": 0
#     },
#     "solutions": 20,
#     "refundable": false
#   }
# }

# result = HTTParty.post('https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyC_DUAzo9utpNjb-5WHeOahZyKcIwyLnpk',
#     :headers => { 'Content-Type' => 'application/json', 'payload' => options.to_json } )

# pp result

    # pp Partay.post('https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyC_DUAzo9utpNjb-5WHeOahZyKcIwyLnpk', options)

    # response = RestClient.post "https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyC_DUAzo9utpNjb-5WHeOahZyKcIwyLnpk",
    #              {
    #                request: {
    #                  passengers: {
    #                    adultCount: 1
    #                  },
    #                  slice: [
    #                    {
    #                      origin: "BOS",
    #                      destination: "LAX",
    #                      date: "2014-10-14"
    #                    },
    #                    {
    #                      origin: "LAX",
    #                      destination: "BOS",
    #                      date: "2014-11-14"
    #                    }
    #                  ]
    #                }
    #              }.to_json,
    #              :content_type => :json
    # puts response.body

  end

end
