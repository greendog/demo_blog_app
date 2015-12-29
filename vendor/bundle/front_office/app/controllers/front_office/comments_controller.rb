require_dependency "front_office/application_controller"

module FrontOffice
  class CommentsController < ApplicationController
    include SimpleCaptcha::ControllerHelpers

    def create
      if simple_captcha_valid?
        Post.find(params[:post_id]).comments.create(comment_params)
        flash[:notice] = I18n.t('successfully')
        redirect_to post_path params[:post_id]
      else
        flash[:error] = I18n.t('simple_captcha.message.default')
        redirect_to post_path(params[:post_id])
      end
    end


    private

    def comment_params
      params.require(:comment).permit(:body, :email, :name)
    end
  end
end
