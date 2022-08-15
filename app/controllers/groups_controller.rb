class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end
    
    def new
        @group = Group.new
    end
    def create
        group = Group.new(group_params)
        group.save
        redirect_to groups_path
    end 
    
    def edit
    end
    
    def show
    end
    
    private
        def group_params
            params.require(:group).permit(:name, :introduction, :image)
        end
end
