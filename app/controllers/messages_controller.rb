class MessagesController < ApplicationController
  before_action :authenticate_user!

  before_action do
    if Conversation.where("id = #{params[:conversation_id]}").empty?
      redirect_to "/main/home"
    else
      @conversation = Conversation.find(params[:conversation_id])
    end
    
  end

  def index
    puts "index for messages"

    # Make sure the current user can view this conversation
    if @conversation.sender_id != current_user.id and @conversation.recipient_id != current_user.id
      redirect_to "/main/home"
    end

    # Get all the messages
    @messages = @conversation.messages

    # Show only sum of the messages
    @num_messages_to_show = params[:num_messages_to_show].to_i

    # Determine if there are more messages to show
    @more_to_show = false
    if @messages.length > @num_messages_to_show
      @more_to_show = true
      @messages = @messages[-@num_messages_to_show..-1]
    end

    # Get a new message ready
    @message = @conversation.messages.new
  end

  def new
    puts "new for messages"
    @message = @conversation.messages.new
  end

  def create
    puts "create for messages"
    puts "email is #{current_user.email}"
    @message = @conversation.messages.new(message_params)
    @message.user_email = current_user.email
    if @message.save
      redirect_to conversation_messages_path(@conversation, num_messages_to_show: 10)
    end
  end

  private
    def message_params
      params.require(:message).permit(:content, :user_id)
    end
end
