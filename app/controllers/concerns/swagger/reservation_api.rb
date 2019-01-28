module Swagger::ReservationApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/users/{id}' do
      parameter :user_id do
        key :name, :id
      end

      operation :get do
        key :description, 'Finds the specified user'
        key :operationId, :find_user_by_id

        response 200 do
          key :description, 'User specified by its ID'
          schema do
            key :'$ref', :UserOutput
          end
        end
      end

    end
  end
end
