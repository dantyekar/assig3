class AdministratorController < ApplicationController
  before_action :authorize_admin, only: [:show, :update]

  layout 'admin'

end
