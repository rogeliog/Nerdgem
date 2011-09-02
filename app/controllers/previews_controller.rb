class PreviewsController < ApplicationController
  def preview
    @body = params[:body]
    respond_to {|format| format.js }
  end
end
