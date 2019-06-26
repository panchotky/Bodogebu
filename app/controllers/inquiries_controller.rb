class InquiriesController < ApplicationController

  before_action :require_admin, only: [:index]

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
      @inquiries = Inquiry.all
  end

  def show
      @inquiry = Inquiry.find(params[:id])
  end

  def update
      @inquiry = Inquiry.find(params[:id])
      @inquiry.update(params_inquiry)
      redirect_to inquiries_path
  end


  private

      def params_inquiry
          params.require(:inquiry).permit(:title, :body, :user_id)
      end

      def require_admin
              if user_signed_in?

                  if current_user.admin?
                  else
                     redirect_to root_path
                  end
              else
                redirect_to root_path
              end
      end



end
