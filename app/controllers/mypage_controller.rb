class MypageController < ApplicationController
  def mypage
    @user = User.find(current_user.id)
  end
end
