class StaticPagesController < ApplicationController

  def home
    render 'static_pages/home'#,  layout: 'application_login_register'
  end

end