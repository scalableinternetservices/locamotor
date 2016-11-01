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

    if @conversation.sender_id != current_user.id and @conversation.recipient_id != current_user.id
      redirect_to "/main/home"
    end
    @messages = @conversation.messages
    @num_messages_to_show = params[:num_messages_to_show].to_i
    @more_to_show = false
    if @messages.length > @num_messages_to_show
      @more_to_show = true
      @messages = @messages[-@num_messages_to_show..-1]
    end

    @message = @conversation.messages.new
  end

  def new
    puts "new for messages"
    @message = @conversation.messages.new
  end

  def create
    puts "create for messages"
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation, num_messages_to_show: 10)
    end
  end

  private
    def message_params
      params.require(:message).permit(:content, :user_id)
    end
end
