class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    ActionCable.server.broadcast('comments_channel', { mod_message: message_render(@comment) }) if @comment.save
  end

  private

  def message_render(comment)
    render(partial: 'comment', locals: { comment: comment })
  end

  def comment_params
    params.require(:comment).permit(:content, :blog_id)
  end
end
