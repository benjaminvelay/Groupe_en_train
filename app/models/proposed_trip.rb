require 'open-uri'
require 'rest-client'
require 'json'
require 'date'
class ProposedTrip
  attr_reader :total_price, :individual_price, :duration, :departure_date, :arrival_date, :train_type, :train_number, :departure_station, :arrival_station
  def initialize(attrs)
    @total_price = attrs[:total_price]
    @individual_price = attrs[:individual_price]
    @duration = attrs[:duration]
    @departure_date = attrs[:departure_date]
    @arrival_date = attrs[:arrival_date]
    @train_type = attrs[:train_type]
    @train_number = attrs[:train_number]
    @departure_station = attrs[:departure_station]
    @arrival_station = attrs[:arrival_station]
  end

  def self.search(station_departure, station_arrival, trip_date)
    request = {
      "souhaits" => {
        "typeRecherche" => "ALLER",
        "origine" => {
          "codeRR" => nil,
          "nom" => station_departure.to_s,
          "codesOuiBus" => nil},
        "destination" => {
          "codeRR" => nil,
          "nom" => station_arrival.to_s,
          "codesOuiBus" => nil
        },
        "journeeEntiere" => true,
        "dateHeureDepart" => trip_date,
        "trajetDirect" => true,
        "ouibusSelected" => false,
        "passagers" => {
            "bambins" => 0,
            "enfants" => 0,
            "jeunes" => 0,
            "adultes" => 10
        }
      },
      "ongletSeulEtat" => false,
      "ongletSeulPosition" => 3,
      "semaineSuivante" => false,
      "semainePrecedente" => false,
      "correlationID" => "e4eb60e5-6583-4fa0-8bcf-d296c56abf66",
      "langue" => "FR",
      "idAgence" => "MBGVSC",
      "codeMarche" => "FR",
      "idVendor" => nil
    }

    url = 'https://www.voyages-train-groupes.sncf.fr/ws/services/RechercherPropositionsGroupe/RechercherPropositionsGroupe'
    response = RestClient.post url, request.to_json, {content_type: :json, accept: :json}
    @data = JSON.parse(response)

    proposed_trips = []
    @data['ongletsRechercheGroupe'].to_a.each do |index_recherche|
      index_recherche['propositions'].to_a.each do |trip|
        trip_infos = {
          total_price: (trip['tarifs']['classe2']['prix']).to_i,
          individual_price: (trip['tarifs']['classe2']['prixMoyen']).to_i,
          duration: trip['duree'],
          departure_date: Time.at(trip['dateHeureDepart'] / 1000),
          arrival_date: Time.at(trip['dateHeureArrivee'] / 1000),
          train_type: trip['segments'][0]['train']['typeTrain'],
          train_number: trip['segments'][0]['train']['numTrain'],
          departure_station: trip['segments'][0]['origine']['nom'],
          arrival_station: trip['segments'][0]['destination']['nom']
        }

        proposed_trips << ProposedTrip.new(trip_infos) unless trip_infos[:total_price] == 0
       end
    end
    return proposed_trips
  end
end
