class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: "Prototype was successfully created."
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)

  end

  def edit
    # 編集用の設定をしますが、詳細は後から追加します
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: "Prototype was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to root_path, notice: "Prototype was successfully deleted."
    else
      redirect_to prototype_path(@prototype), alert: "Failed to delete the prototype."
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def authorize_user!
    unless @prototype.user == current_user
      redirect_to root_path, alert: "You are not authorized to edit this prototype."
    end
  end
end