class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    puts "conversations controller create"
    @conversation = Conversation.between(params[:sender_id], params[:recipient_id])
    if @conversation.present?
      puts "found old"
      @conversation = @conversation.first
     else
      puts "create new"
      @conversation = Conversation.create!(conversation_params)
     end

    response.headers["ConversationID"] = @conversation.id
    redirect_to conversation_messages_path(@conversation.id, num_messages_to_show: params[:num_messages_to_show])
  end


  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
  end
