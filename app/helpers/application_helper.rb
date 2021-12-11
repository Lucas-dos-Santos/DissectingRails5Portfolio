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
      (link_to 'Register', new_user_registration_path, class: "#{style} #{active?(new_user_registration_path)}") +
        (link_to 'Login', new_user_session_path, class: "#{style} #{active?(new_user_session_path)}")
    else
      link_to 'Logout', destroy_user_session_path, method: :delete,
                                                   class: "#{style} #{active?(destroy_user_session_path)}"
    end
  end

  def source_helper
    return unless session[:source].present?

    message = "Obrigado por me visitar atraves do #{session[:source]}"
    content_tag(:p, message, class: 'text-center')
  end

  def copyright_generator
    LucasDevcampViewTool::Renderer.copyright('Lucas dos Santos', '- All Rights Reserved.')
  end

  def social_links(class_color)
    (link_to 'https://github.com/Lucas-dos-Santos', target: '_blank' do
      "<i class='fab fa-github text-#{class_color}'></i>".html_safe
    end) +
      (link_to 'https://www.instagram.com/lucas._luke', target: '_blank' do
        '<i class="fab fa-instagram text-danger"></i>'.html_safe
      end) +
      (link_to 'https://www.facebook.com/lucas.dossantos.98892', target: '_blank' do
        '<i class="fab fa-facebook"></i>'.html_safe
      end)
  end

  def nav_items
    [
      { url: root_path, title: 'Home' },
      { url: about_me_path, title: 'About' },
      { url: contact_path, title: 'Contact' },
      { url: blogs_path, title: 'Blog' },
      { url: portfolios_path, title: 'Portfolio' }
    ]
  end

  def nav_helper(style, tag_start = '', tag_end = '')
    nav_links = ''
    nav_items.each do |item|
      nav_links << "#{tag_start}<a href=#{item[:url]} class='#{style} #{active?(item[:url])}'>#{item[:title]}</a>#{tag_end}"
    end
    nav_links.html_safe
  end

  def active?(path)
    'active' if current_page?(path)
  end
end
