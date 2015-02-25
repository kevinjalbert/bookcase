module Jekyll
  module SelectFromBooksFilter
    def author_select_from_books(books)
      values = Set.new

      books.map do |book|
        book.to_liquid['authors'].map do |author|
          values << author
        end.flatten
      end

      values.map do |value|
        "<option value=#{@context['site']['baseurl']}/authors/#{value.downcase.gsub(' ', '_')}.html>#{value}</option>"
      end.join("\n")
    end

    def tag_select_from_books(books)
      values = Set.new

      books.map do |book|
        book.to_liquid['tags'].map do |tag|
          values << tag
        end.flatten
      end.flatten

      values.map do |value|
        "<option value=#{@context['site']['baseurl']}/tags/#{value.downcase.gsub(' ', '_')}.html>#{value}</option>"
      end.join("\n")
    end
  end
end

Liquid::Template.register_filter(Jekyll::SelectFromBooksFilter)
