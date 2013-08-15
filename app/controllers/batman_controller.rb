class BatmanController < ApplicationController

  def index
    @preview = params[:preview]
    render nothing: true, layout: 'batman'
  end

end
