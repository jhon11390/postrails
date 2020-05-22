class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @title = "Nuevo Post"
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to :posts
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        @title = "Editar Post"
    end 

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to :posts
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to :posts
    end
    private
        def post_params
            params.require(:post).permit(:title, :body)
        end
end
