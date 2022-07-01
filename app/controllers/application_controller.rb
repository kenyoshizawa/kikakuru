class ApplicationController < ActionController::Base
  include ApplicationHelper
  include Pundit::Authorization
end
