module SessionsHelper

    #セッション委利用者IDを保存する
    def log_in(user)
        session[:user_id] = user.id
        cookies.signed[:user_id] = user.id
    end

    #利用者IDをキーにして利用者情報を取得する
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    #利用者がログインしているかどうかを真偽地を返す
    def logged_in?
        !current_user.nil?
    end

    #利用者がログインしていなければログイン画面に遷移する
    def require_login
        redirect_to login_path if !logged_in?
    end

    #ログアウトする
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
