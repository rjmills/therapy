class NewsPostsController < ApplicationController
	def index
		@posts = NewsPost.order("created_at DESC")
	end

	def show
		@post = NewsPost.find_by_id(params[:id])
	end

	def new
		@post = NewsPost.new()
	end

	def create
		@post = NewsPost.new(news_post_params)
		if @post.save
			flash[:success] = "News Post Created"
			redirect_to news_posts_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @post.update_attributes(news_post_params)
			flash[:success] = "News Post Updated"
			redirect_to news_posts_path
		else
			render :edit
		end
	end

	def destroy
		if @post.destroy
			flash[:success] = "News Post Removed"
			redirect_to news_posts_path
		else
			render :edit
		end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = NewsPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_post_params
      params.require(:news_post).permit(:title, :body, :user_id)
    end
end

