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

  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: style) +
        (link_to 'Login', new_user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper
    return unless session[:source].present?

    message = "Obrigado por me visitar atraves do #{session[:source]}"
    content_tag(:p, message, class: 'text-center')
  end

  def copyright_generator
    LucasDevcampViewTool::Renderer.copyright('Lucas dos Santos', 'Todos os direitos reservados.')
  end
end
