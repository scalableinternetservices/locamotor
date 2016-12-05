class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @users = User.all
    current_id = current_user.id
    @conversations = Conversation.where("sender_id = #{current_id} OR recipient_id = #{current_id}")
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
      sender = User.find(params[:sender_id])
      recipient = User.find(params[:recipient_id])
      @conversation.sender_email = sender.email

      @conversation.recipient_email = recipient.email

      @conversation.save
    end
    
    puts "Sender email is #{@conversation.sender_email}"
    puts "recipient email is #{@conversation.recipient_email}"

    response.headers["ConversationID"] = @conversation.id
    redirect_to conversation_messages_path(@conversation.id, num_messages_to_show: params[:num_messages_to_show])
  end


  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
  end
