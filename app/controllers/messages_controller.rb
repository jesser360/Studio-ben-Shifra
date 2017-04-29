class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def newMessage
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  def destroyMessage
    @message = Message.find(params[:id])
    if logged_in? && current_user == @message.user
      @message.destroy
      flash[:notice] = @message.content + " was destroyed 4ever"
      redirect_to :back
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

  def createMessage
    @message = Message.new(message_params)
    puts"HEY IM PARAMS OVER HERE"
    puts message_params[:content]
    puts params[:product_title]
    puts"HEY IM PARAMS OVER HERE"
    if session[:user_id]
        # @product = Product.find(params[:product_id])
        @title = params[:product_title]
        @productFind = Product.where(title: @title)
        @product = @productFind[0]
        puts "NAME HERE!!!!"
        puts @product.title
        puts current_user
        @message.user = current_user
        @message.product = @product
        if @message.save
          redirect_to :back
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
    params.require(:message).permit(:content,:product_title)#.merge(:product_id => params[:product_id])
  end

end
