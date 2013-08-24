class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Isso arruma o envio de alguma coisa no strong parameters
  before_action do
  	resource = controller_path.singularize.gsub('/','_').to_sym
  	method = "#{resource}_params"
  	params[resource] &&= send(method) if respond_to?(method,true)
  end

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to post_path(@post), :notice => "Acesso Negado!"
  end 
end
