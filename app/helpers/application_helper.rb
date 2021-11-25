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
end
