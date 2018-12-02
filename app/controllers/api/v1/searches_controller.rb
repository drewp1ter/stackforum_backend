class  Api::V1::SearchesController < Api::V1::ApplicationController

  def show
    render json: Search.result(params[:query]), each_serializer: QuestionsListItemSerializer
  end

end
