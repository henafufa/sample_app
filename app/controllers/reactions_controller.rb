class ReactionsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_react, only: :create

    def create
        @user = @micropost.user
        @reaction = current_user.reactions.build(micropost_id: @micropost.id)
        if @reaction.save
            flash[:success] = "post liked!"
            redirect_to request.referrer || root_url  
        else
            @microposts = @user.microposts.paginate(page:params[:page])
            render 'users/show'
        end
    end

    def destroy
    end

    def correct_react
        @micropost = Micropost.find(params[:micropost_id])
        redirect_to root_url if @micropost.nil?
    end


    private
    def micropost_params
        # params.require(:reaction).permit(:micropost_id)
    end
end
