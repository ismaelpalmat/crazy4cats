class ReactionsController < ApplicationController
  before_action :set_post

  def create
    # Asumiendo que el modelo Reaction tiene :like y :post_id
    @reaction = @post.reactions.find_or_initialize_by(user: current_user)

    @reaction.like = params[:like] == "true" # Si el valor es "true", es un "Me gusta", si es "false", es un "No me gusta"

    if @reaction.save
      redirect_to @post, notice: "Reacción registrada correctamente."
    else
      redirect_to @post, alert: "Error al guardar la reacción."
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
