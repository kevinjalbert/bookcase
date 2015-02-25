require 'rake'
require 'jekyll'

def build_yml_content(values)
  values.map do |value|
    "- link: '#{value.downcase.gsub(' ', '_')}'\n" +
    "  display_name: '#{value}'"
  end.join("\n")
end

def write_yml_content(file_path, content)
  File.open(file_path, 'w') do |file|
    file.truncate(0)
    file.write(content)
  end
end

desc 'Synchronize all author and tags to data files'
task :sync_resources do
  all_authors = Set.new
  all_tags = Set.new

  Dir.glob('./_books/**/*').each do |book_file|
    content = File.read(book_file)

    content.scan(/^authors: \[(.+)\]/).flatten.each do |authors|
      authors.split(', ').each do |author|
        all_authors << author[1..-2]
      end
    end

    content.scan(/^tags: \[(.+)\]/).flatten.each do |tags|
      tags.split(', ').each do |tag|
        all_tags << tag[1..-2]
      end
    end
  end

  write_yml_content('./_data/authors.yml', build_yml_content(all_authors))
  write_yml_content('./_data/tags.yml', build_yml_content(all_tags))
end

desc "Generate site"
task :generate do
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "_site"
  })).process
end

desc "Generate and publish site to gh-pages"
task :publish => [:generate] do
  Dir.mktmpdir do |tmp|
    system "mv _site/* #{tmp}"
    system "git checkout -B gh-pages"
    system "rm -rf *"
    system "mv #{tmp}/* ."
    message = "Site updated at #{Time.now.utc}"
    system "git add ."
    system "git commit -am #{message.shellescape}"
    system "git push origin gh-pages --force"
    system "git checkout master"
  end
end

task :default => :publish
