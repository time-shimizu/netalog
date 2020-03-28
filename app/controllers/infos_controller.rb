class InfosController < ApplicationController
  before_action :authenticate_user!

  def index
    @infos = current_user.infos.page(params[:page]).per(10)
  end
end
