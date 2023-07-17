class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blog_path(@blog), notice: t("notice.create")
      else
        render :new
      end
    end
  end

  def show
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), notice: t("notice.update")
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: t("notice.destroy")
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache, :disease_name, :age_range)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end