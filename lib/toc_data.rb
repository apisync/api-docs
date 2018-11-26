require 'nokogiri'

def toc_data(page_content)
  html_doc = Nokogiri::HTML::DocumentFragment.parse(page_content)

  # get a flat list of headers
  headers = []
  html_doc.css('h1, h2, h3').each do |header|
    #puts header.children
    #puts Nokogiri::HTML.fragment(header.children)
    headers.push({
      id: header.attribute('id').to_s,
      # When h1.section, we will show it in a different color in the
      # navigation bar
      class: header.attribute('class').to_s.match(/section/) ? "section" : "",
      html_safe_content: header.children.first.text,
      content: header.children,
      level: header.name[1].to_i,
      children: []
    })
  end

  [3,2].each do |header_level|
    header_to_nest = nil
    headers = headers.reject do |header|
      if header[:level] == header_level
        header_to_nest[:children].push header if header_to_nest
        true
      else
        header_to_nest = header if header[:level] < header_level
        false
      end
    end
  end
  headers
end
