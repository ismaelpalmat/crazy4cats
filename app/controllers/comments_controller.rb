class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user unless @comment.anonymous # Si no es anónimo, asigna el usuario actual

    if @comment.save
      redirect_to @post, notice: 'Comentario creado con éxito.'
    else
      render 'posts/show'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])  # Encuentra el post con el id que se pasa en los parámetros
  end

  def comment_params
    params.require(:comment).permit(:content, :anonymous)
  end
end