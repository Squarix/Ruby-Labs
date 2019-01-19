class CommentsController < ApplicationController
before_action :find_commentable

    def new
      @comment = Comment.new
    end

    def create
      session[:return_to] ||= request.referer
      @comment = @commentable.comments.new comment_params
      if @comment.save
        redirect_to session.delete(:return_to), notice: 'Your comment was successfully posted!'
      else
        redirect_to session.delete(:return_to), danger: 'Your comment wasn`t posted!'
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end

end