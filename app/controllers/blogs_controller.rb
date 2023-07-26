class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  before_action :set_q, only: [:index]
  before_action :authenticate_user!, only: %i[new edit update destroy]
  before_action :check_user, only: %i[edit update destroy]

  def index
    @blogs = @q.result(distinct: true).order(created_at: :desc)
    @q = Blog.ransack
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
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
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  def edit
  end

  def update
    if params[:blog][:image_ids]
      params[:blog][:image_ids].each do |image_id|
        image = @blog.images.find(image_id)
        image.purge
      end
    end
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
    params.require(:blog).permit(:title, :content, :disease_name, :age_range, :cat_id, { symptom_ids: [] }, images: [])
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def set_q
    @q = Blog.ransack(params[:q])
  end

  def check_user
    redirect_to blog_path unless current_user == @blog.user
  end
end
