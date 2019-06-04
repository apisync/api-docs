# Unique header generation
require 'middleman-core/renderers/redcarpet'

class UniqueHeadCounter < Middleman::Renderers::MiddlemanRedcarpetHTML
  def initialize
    super
    @head_count = {}
  end

  def header(text, header_level)
    friendly_text = text.parameterize
    if friendly_text =~ /.*-span-.*/
      friendly_text = friendly_text.gsub(/(.*)-span-.*/, '\1')
    end
    @head_count[friendly_text] ||= 0
    @head_count[friendly_text] += 1
    if @head_count[friendly_text] > 1
      friendly_text += "-#{@head_count[friendly_text]}"
    end

    "<h#{header_level} id='#{friendly_text}'>#{text}</h#{header_level}>"
  end
end
