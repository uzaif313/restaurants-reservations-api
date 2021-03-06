module Swagger::ReservationApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/restaurants/{id}/reservations' do
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of restaurant to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end

      operation :get do
        key :description, 'Finds the specified restaurant reservations'
        key :operationId, :find_restaurant_by_id

        response 200 do
          key :description, 'Restaurnt specified by its ID'
          schema do
            key :'$ref', :UserOutput
          end
        end
      end

    end

    swagger_path '/reservations' do
      parameter do
        key :name, :reservations
        key :in, :body
        key :description, 'Create Reservation'
        key :required, true
        key :type, :integer
        schema do
            key :'$ref', :ReservationInput
        end
      end

      operation :post do
      
        response 200 do
          key :description, 'Reservation'
          schema do
            key :'$ref', :ReservationInput
          end
        end
      end

    end
  end
end
