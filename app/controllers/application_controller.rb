class ApplicationController < ActionController::Base
    def hello
        @disable_nav = true
    end
end
