class SessionsController < ApplicationController
  def new
    #登入頁面使用
  end

  def create
    #尋找使用者
    user = User.find_by(name: params[:name])   
    #驗證使用者，若成功，就建立一個 session，把 user_id 放入 session hash
    # binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Hello, #{current_user.name}!"
    elsif !user
      redirect_to login_path, notice: "Username does not exist, please try again."
    else
      redirect_to login_path, notice: "Invalid password, please try again."
    end
  end

  def destroy
    #登出畫面使用，刪除 session hash 裡面的 user_id
    redirect_to root_path, notice: "Bye #{current_user.name}, see you next time!"
    session[:user_id] = nil
    
  end
end
