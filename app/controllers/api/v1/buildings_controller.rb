module Api
  module V1
    class BuildingsController < BaseController
    
      def index
        @buildings = Building.all
      end
      
    end
  end
end