module Jekyll
  module LinkStringFilter
    def link_author_string(authors)
      authors.map do |author|
        "<a href=#{@context['site']['baseurl']}/authors/#{author.downcase.gsub(' ', '_')}.html>#{author}</a>"
      end.join(', ')
    end

    def link_tag_string(tags)
      tags.map do |tag|
        "<li><a href=#{@context['site']['baseurl']}/tags/#{tag.downcase.gsub(' ', '_')}.html>#{tag}</a></li>"
      end.join(' ')
    end
  end
end

Liquid::Template.register_filter(Jekyll::LinkStringFilter)
