require 'mechanize'
require 'uri'

# first online 'Photo of the day' (2009-01-01)
first_url = 'http://photography.nationalgeographic.com/photography/photo-of-the-day/sailboats-durrance/'
urls_path = 'photos_urls.txt'
last_url_path = 'last_url.txt'

agent = Mechanize.new
agent.user_agent_alias = 'Linux Firefox'
agent.max_history = 1

current_url = if File.exists?(last_url_path)
  File.open(last_url_path, 'r') { |io| io.readline.chomp }
else
  first_url
end

File.open(urls_path, 'a') do |io|
  while !current_url.nil?
    doc = agent.get(current_url)
    puts doc.at('p.publication_time').inner_text

    download_link = doc.at('div.download_link a')
    io.puts URI.join(current_url, download_link['href']) unless download_link.nil?

    File.open(last_url_path, 'w') { |io| io.puts current_url }

    next_link = doc.at('div.nav p:last a')
    current_url = unless next_link.nil?
      URI.join(current_url, next_link['href']).to_s
    end
  end
end
