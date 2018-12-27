class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    #skip for devise, admin controller or pages controller
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
