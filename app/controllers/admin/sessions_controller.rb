class Admin::SessionsController < Admin::Base
  #skip_before_action :authorize

  def new
    if current_administrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: "new"
    end
  end

  def create
    @form = Admin::LoginForm.new(params[:admin_login_form])
    if @form.email.present?
      administrator =
        Administrator.find_by("LOWER(email) = ?", @form.email.downcase)
    end
    if Admin::Authenticator.new(administrator).authenticate(@form.password)
      if administrator.suspended?
        #staff_member.events.create!(type: "rejected")
        flash.now.alert = "アカウントが停止されています。"
        render action: "new"
      else
        session[:administrator_id] = staff_member.id
        #session[:last_access_time] = Time.current
        #staff_member.events.create!(type: "logged_in")
        flash.notice = "ログインしました。"
        redirect_to :admin_root
      end
    else
      flash.now.alert = "メールアドレスまたはパスワードが正しくありません。"
      render action: "new"
    end
  end

  def destroy
    session.delete(:administrator_id)
    flash.notice = "ログアウトしました。"
    redirect_to :admin_root
  end
end
