class PostsController < ApplicationController
  def index
    @posts = Post.all # Aquí asignas todos los posts a @posts
  end

  def show
    @post = Post.find(params[:id])  # Asegúrate de que se esté buscando por ID
  end

  def new
  end

  def create
  end
end
