class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype=Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :presenter, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
