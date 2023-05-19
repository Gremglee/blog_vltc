class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pagy::Backend
  include Pundit
end
