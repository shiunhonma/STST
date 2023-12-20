class ApplicationController < ActionController::Base
    include SessionsHelper
    include UserRoomsHelper
    before_action :require_login
end
