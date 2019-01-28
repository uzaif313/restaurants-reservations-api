module Swagger::ReservationApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/restaurants/{id}' do
      parameter :id

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
  end
end
