class Api::V1::ApplicationController < ActionController::API
	include ResponseFormatter
	include SerializableResource
end