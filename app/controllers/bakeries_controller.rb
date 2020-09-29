class BakeriesController < ApplicationController

    def index
        @bakery = bakery.all
        
    end

end
