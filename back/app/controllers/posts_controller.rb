class PostsController < ApplicationController
  #before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize_post_owner, only: %i[edit update destroy]


def index
    @posts = Post.all
end

def show
    #@post = Post.find(params[:id])
end

def new
    @post = Post.new
end

def edit
  #  @post = Post.find(params[:id])
end

def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "Post criado com sucesso!"
    else
      render :new
    end
end

def update
    if @post.update(post_params)
      redirect_to @post, notice: "Postagem atualizada com sucesso!"
    else
      render :edit
    end
end

def destroy
    @post.destroy
    redirect_to posts_url, notice: "Postagem deletada com sucesso!"
end

  private
    
def set_post
    @post = Post.find(params[:id])
end

def authorize_post_owner
    unless @post.user == current_user
      redirect_to posts_url, alert: "Você não tem permissão para realizar esta ação."
    end
end
    
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
