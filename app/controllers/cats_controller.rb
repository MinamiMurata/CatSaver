class CatsController < ApplicationController
  before_action :set_cat, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy]
  before_action :check_user, only: %i[edit update destroy]

  def new
    @cat = Cat.new
  end

  def create
    @cat = current_user.cats.build(cat_params)
    if params[:back]
      render :new
    else
      if @cat.save
        redirect_to cat_path(@cat), notice: t("notice.cat_create")
      else
        render :new
      end
    end
  end

  def show
  end

  def confirm
    @cat = current_user.cats.build(cat_params)
    render :new if @cat.invalid?
  end

  def edit
  end

  def update
    if @cat.update(cat_params)
      redirect_to cat_path(@cat), notice: t("notice.cat_update")
    else
      render :edit
    end
  end

  def destroy
    @cat.destroy
    redirect_to blogs_path, notice: t("notice.cat_destroy")
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :introduction, :image, :image_cache, :birthday, :breed_id)
  end

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def check_user
    redirect_to cat_path unless current_user == @cat.user
  end
end
