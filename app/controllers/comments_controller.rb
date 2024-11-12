class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user if current_user.present?
    if @comment.save
      redirect_to @post, notice: "Comentario agregado!"
    else
      redirect_to @post, alert: "No se pudo agregar el comentario"
  end
end

private

def comment_params
    params.require(:comment).permit(:content, :anonymous)
  end
end
