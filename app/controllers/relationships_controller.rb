class RelationshipsController < ApplicationController
before_action :logged_in_user

        def create
            @user = User.find(params[:followed_id]) # Change 'user' to '@user' for consistency
            current_user.follow(@user)
        
            respond_to do |format|
            format.html { redirect_to @user }
            format.js
            end
        end
  
    def destroy
        relationship = Relationship.find(params[:id])
        user = relationship.followed
        current_user.unfollow(user)
        @user = user
        respond_to do |format|           
          format.html { redirect_to @user }
          format.js 

        end
      end
end
