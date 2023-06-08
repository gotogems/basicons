require 'rails'

module BasiconsHelper
  class Railtie < Rails::Railtie
    initializer 'basicons_helper.helper' do
      ActionView::Base.send :include, BasiconsHelper
    end
  end
end
