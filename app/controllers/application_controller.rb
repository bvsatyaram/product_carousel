class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

protected
  def activate_tab(tab_identifier)
    allowed_tabs = [:preview, :configure]

    raise InvalidTabActivated unless allowed_tabs.include?(tab_identifier)
    @active_tab = tab_identifier
  end
end
