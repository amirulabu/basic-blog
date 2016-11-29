class PostsController < ApplicationController
	before_action :find_post, only:[:edit, :update, :show, :delete]

	# render all post

	def index
		@posts = Post.all
	end

	# create new post
	def new
		@post = Post.new
	end

	# saves the post into database
	def create
		@post = Post.new
		if @post.save(post_params)
			flash[:notice] = "Post created!"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Error creating new post!"
			render :new
		end
	end

	# Edit action retrives the post and renders the edit page
	def edit
	end

	# Update action updates the post with the new information

	def update
		if @post.update(post_params)
			flash[:notice] = "Post updated!"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Error updating post!"
			render :new
		end
	end

	# Show action shows the individual post after retrieving the id
	def show
	end

	# The destroy action removes the post permanently from the database
	def destroy
		if @post.destroy
			flash[:notice] = "Post deleted!"
			redirect_to posts_path
		else
			flash[:alert] = "Errr updating post!"
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def find_post
		@post = Post.find(params[:id])
	end
	
end
