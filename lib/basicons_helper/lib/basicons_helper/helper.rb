require 'basicons'
require 'action_view'

module BasiconsHelper
  include ActionView::Helpers::TagHelper
  mattr_accessor :basicons_helper_cache, default: {}

  def basicon(symbol, options = {})
    return '' if symbol.nil?
    cache_key = [symbol, options]

    if tag = basicons_helper_cache[cache_key]
      tag
    else
      icon = Basicons::Basicon.new(symbol, options)
      tag = content_tag(:svg, icon.data.html_safe, icon.options).freeze
      basicons_helper_cache[cache_key] = tag
      tag
    end
  end
end
