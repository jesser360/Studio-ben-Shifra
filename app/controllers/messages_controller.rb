class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.find(params[:id])
    if logged_in? && current_user == @message.user
      @message.destroy
      flash[:notice] = @message.content + " was destroyed 4ever"
      redirect_to '/messages'
      else
        redirect_to '/messages'
        flash[:notice] = "Not authorized to edit"
      end
  end

  def edit
    @message = Message.find(params[:id])
    if logged_in? && current_user == @message.user
    else
      redirect_to '/messages'
      flash[:notice] = "Not authorized to edit"
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      flash[:notice] = @message.content + "update"
        redirect_to '/messages/show/'+@message.id.to_s
    else
      render 'edit'
  end
end

  def create
    @message = Message.new(message_params)
    if session[:user_id]
        @message.user = current_user
        if @message.save
          redirect_to '/messages/show/'+@message.id.to_s
        else
          render 'new'
        end
    else
      flash[:notice] = "Please sign in to write  a message"
      redirect_to '/messages'
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
