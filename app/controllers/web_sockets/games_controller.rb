class WebSockets::ActionsController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    controller_store[:game] = Game.find(1)
  end


end
