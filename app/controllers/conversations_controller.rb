class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
    @show = false
  end

  def create
    puts "conversations controller create"
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
     else
      @conversation = Conversation.create!(conversation_params)
     end

    @show = true
    response.headers["ConversationID"] = @conversation.id
    redirect_to conversation_messages_path(@conversation.id, num_messages_to_show: params[:num_messages_to_show])
  end


  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
  end
