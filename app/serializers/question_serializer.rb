class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :access, :score, :comments, :author

  has_many :answers, each_serialiser: AnswerSerializer
  has_many :attachments, each_serialiser: AttachmentSerializer

  delegate :request, to: :scope
  delegate :current_ability, to: :scope

  def created_at
    object.created_at.strftime("%d.%m.%y %H:%M:%S")
  end

  def author
    {
      id: object.user.id,
      name: object.user.name,
      avatar: object.user.avatar.present? ? scope.request.base_url + object.user.avatar.image.thumb.url : scope.request.base_url + '/images/def_avatar.jpg'
    }
  end

  def comments
    object.comments.ordered.map {
      |comment| CommentSerializer.new(comment, {scope: current_ability})
    }
  end

  def access
    scope.can?(:access, object)
  end

  def answers
    object.answers.ordered
  end

end
