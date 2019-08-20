class VansController < ApplicationController
  def index
    @vans = Van.all
  end

  def show
    @van = Van.find(params[:id])
  end

  def new
    @van = Van.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def accepted_params
  end

  def find_van
  end
end
