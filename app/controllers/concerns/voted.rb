module Voted
  extend ActiveSupport::Concern

  included do
    before_action :set_post, only: :vote
  end

  def vote
    case params[:vote]
    when 'UP'
      render json: responce(1)
    when 'DOWN'
      render json: responce(-1)
    end
  end

  private

  def responce(change_to)
    {
      score: @post.change_vote(current_user, change_to),
      votable_type: @post.class.to_s,
      votable_id: @post.id
    }
  end

  def set_post
    @post = controller_name.classify.constantize.find(params[:id])
  end

end
