class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate, except: [:index, :new, :show, :create]
  
  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new 
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.author.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def filter
    search = params[:search]

    if search.match? /^[0-9]+$/
      filter_by_id search.to_i 
    else
      filter_by_name search if search.is_numeric?
    end

    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  private

  def filter_by_id(search)
    @posts = Post.where(id: search)
  end

  def filter_by_name(search)
    @posts = Post.where(id: search)
  end 

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find_by(id: params[:id])
    self.send_error_info unless @post.present?
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.fetch(:post, {}).permit(:title, :content, :author_id, :tag_id, :visible)
  end

  def authenticate
    return if current_user.is_admin?
    unless @post.author.user == current_user
      not_found
    end
  end
end
