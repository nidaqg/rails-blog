class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfully!"
            redirect_to user
        else
            flash.now[:alert] = "Entered wrong email or password, Try again"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged Out"
        redirect_to articles_path
    end

end