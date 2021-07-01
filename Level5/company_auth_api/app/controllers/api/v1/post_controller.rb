class Api::V1::PostController < ApiController
    
  protect_from_forgery
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  def index
    puts current_user.email
    render json: { user: current_user.email, list: [1, 2, 3] }
  end

  private
  
      def record_not_found(error)
          render json: {status: "ERROR", error: error.message,}, status: :not_found
      end

end