class AccessController < ApplicationController

  layout 'application'

  skip_before_action :confirmed_log_in?, only: [:new, :create]

  # display menu
  def menu 
       # Examples of render options:
    #
    # render('menu')
    #
    # render(plain: "Just render text.")
    #
    # render(html: "<strong>HTML text</strong>")
    #
    # render(json: Task.first)
    #
    # render(xml: ['dog', 'cat', 'mouse'])
    #
    # render(plain: 'OK', status: 200)
    #
    # path_to_404 = Rails.root.join('public', '404.html')
    # render(file: path_to_404)
    #
    # send_file(path_to_404)
    #
    # string = render_to_string(file: path_to_404)
    # logger.debug(string)     
  end

  # display login form
  def new
    
    if logged_in?
      redirect_to(menu_path)
    end
  end

  # processs login form
  def create
    # do login process here
    logger.info("***Login User #{params[:username]}")
    cookies[:username] = params[:username]
    session[:user_id] = 1989
    flash[:notice] = 'Log in successful'
    redirect_to(menu_path)
  end

  # logout user
  def destroy
    # do logout process here
    logger.info("***Log out User #{cookies[:username]}")
    cookies[:username] = nil
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to(login_path)
  end

end
