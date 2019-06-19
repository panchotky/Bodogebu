class InquiriesController < ApplicationController

  def new
      @inquiry = Inquiry.new
  end

  def confirm
      @inquiry = Inquiry.new(params_inquiry)
      @inquiry.user_id = current_user.id
      if @inquiry.valid?
      render :action => 'confirm'
      else
      render :new
      end
  end

  def create
      @inquiry = Inquiry.new(params_inquiry)
      @inquiry.user_id = current_user.id
      @inquiry.save
      render :create
  end

  def index
  end

  def show
  end


  private

      def params_inquiry
          params.require(:inquiry).permit(:title, :body, :user_id)
      end



end
