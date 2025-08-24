# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  # Callback to set the @post instance variable before certain actions.
  # This avoids repeating `Post.find(params[:id])` in multiple actions.
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts
  # Displays a list of all posts.
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # Displays a single post and its associated comments.
  def show
    # @post is already set by the `set_post` before_action.
    # A new comment object is initialized for the comment form on the show page.
    @comment = @post.comments.build
  end

  # GET /posts/new
  # Displays a form to create a new post.
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  # Displays a form to edit an existing post.
  def edit
    # @post is already set by the `set_post` before_action.
  end

  # POST /posts
  # Creates a new post based on the submitted form data.
  def create
    @post = Post.new(post_params)

    if @post.save
      # If the post is saved successfully, redirect to its show page with a success notice.
      redirect_to @post, notice: "Post was successfully created."
    else
      # If there are validation errors, re-render the 'new' template to show the errors.
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  # Updates an existing post based on the submitted form data.
  def update
    if @post.update(post_params)
      # If the post is updated successfully, redirect to its show page with a success notice.
      redirect_to @post, notice: "Post was successfully updated."
    else
      # If there are validation errors, re-render the 'edit' template to show the errors.
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  # Deletes an existing post.
  def destroy
    @post.destroy!
    # Redirects to the posts index page with a success notice after deletion.
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
