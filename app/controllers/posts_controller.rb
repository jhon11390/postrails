class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @titleform = "Nuevo Post"
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
            redirect_to :posts, notice: "El post fue publicado con éxito"
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        @titleform = "Editar Post"
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

        redirect_to :posts, notice: "El post ha sido eliminado con éxito"
    end
    private
        def post_params
            params.require(:post).permit(:title, :body)
        end
end
