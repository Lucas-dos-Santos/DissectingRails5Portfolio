module ApplicationHelper
  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      if %w[success error].include?(type)
        text = "<script>toastr.#{type}('#{message}')</script>"
        flash_messages << text.html_safe if message
      end
    end.join("\n").html_safe
  end

  def login_helper
    if current_user.is_a?(User)
      link_to 'Logout', destroy_user_session_path, method: :delete
    else
      (link_to 'Register', new_user_registration_path) +
        '<br>'.html_safe +
        (link_to 'Login', new_user_session_path)
    end
  end
end
