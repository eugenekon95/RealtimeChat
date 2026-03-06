class MessagesController < ApplicationController
  before_action :set_messageable, only: :create
  before_action :set_message, only: :destroy

  def create
    return messageable_not_found unless @messageable

    @message = @messageable.messages.build(
      body: message_params[:body],
    # attachments: message_params[:attachments]
    )
    @message.user = current_user

    if @message.save
      head :ok
    else
      flash[:danger] = @message.errors.full_messages.to_sentence
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    if @message.user == current_user
      @message.destroy
      head :ok
    else
      flash[:alert] = "You cannot delete this message"
      redirect_back fallback_location: root_path
    end
  end

  private

  def set_messageable
    @messageable =
      if params[:room_id]
        Room.find_by(id: params[:room_id])
      elsif params[:group_id]
        Group.find_by(id: params[:group_id])
      end
  end

  def set_message
    @message = Message.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Message doesn't exist"
    redirect_back fallback_location: root_path
  end

  def message_params
    params.require(:message).permit(:body)
  end

  def messageable_not_found
    flash[:alert] = "A message cannot be created"
    redirect_back fallback_location: root_path
  end
end
