class Api::AccountsController < Api::ApplicationController
  skip_before_action :authenticate_user!, only: [:sign_in]

  def sign_in
    m_requires! [:username, :password]
    @user = User.find_by(username: params[:username])

    if @user
      status, message = @user.login(params[:password], request.ip)
      if status
        @user
      else
        render_json([401, message])
      end
    else
      render_json([401, '账户不存在'])
    end
  end

  def sign_out
    if current_user.update(access_token: nil)
      result =[0, '登出成功']
    else
      result =[1, '登出失败']
    end
    render_json(result)
  end

end