class ReactionsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @reaction = @post.reactions.find_or_initialize_by(user: current_user)
    @reaction.like = params[:like]
    if  @reaction.save
      redirect_to @post, notice: "Reaccion registrada"
    else
      redirect_to @post, alert "No se pudo registrar tu reaccion"
    end
  end
end
