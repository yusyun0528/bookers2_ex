class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end
    
    def new
        @group = Group.new
    end
    def create
        group = Group.new(group_params)
        group.owner_id = current_user.id
        group.save
        group_user = GroupUser.new(user_id: current_user.id, group_id: group.id)
        group_user.save!
        redirect_to groups_path
    end 
    
    def edit
        @group = Group.find(params[:id])
        if not @group.owner?(current_user)
            redirect_to groups_path
        end
    end
    
    def show
        @group = Group.find(params[:id])
    end
    
    def update
        group = Group.find(params[:id])
        group.update(group_params)
        redirect_to groups_path
    end
    
    def mail
        @group = Group.find(params[:id])
    end
    
    def send_mail
        group = Group.find(params[:id])
        @title = params[:title]
        @content = params[:content]
        InquiryMailer.send_mail(group,@title,@content).deliver_now
    end
    
    
    private
        def group_params
            params.require(:group).permit(:name, :introduction, :image)
        end
end
