class DirectMassagesController < ApplicationController
    
    def create
        user = User.find(params[:user_id])
        massage = DirectMassage.new(massage_params)
        massage.sender_id = current_user.id
        massage.receiver_id = user.id
        massage.save
        redirect_to direct_massages_user_path(user)
    end
    
    private
    def massage_params
        params.require(:direct_massage).permit(:body)
    end
end
