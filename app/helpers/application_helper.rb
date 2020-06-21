module ApplicationHelper
  # デバイスをトップに持ってくるために記述
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
    User
  end

  #ページごとにタイトルをつける
  def full_title(title = "")
    base_title = "Trachil"
		# if admin_signed_in?
		# 	base_title + "|" + "(管理者) #{title}"
		# else
			base_title + "　|　" + "#{title}"
		# end
	end
end
