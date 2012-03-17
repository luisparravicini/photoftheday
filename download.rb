require 'tempfile'
require 'fileutils'
include FileUtils


urls_path = 'photos_urls.txt'
downloads_dir = ARGV.shift || 'wallpapers'

mkdir_p(downloads_dir) unless File.exists?(downloads_dir)

File.open(urls_path) do |io|
  io.each_line do |url|
    url.strip!.chomp!

    dest_path = File.join(downloads_dir, File.basename(url))
    next if File.exists?(dest_path)

    puts url
    tmp = Tempfile.new('wallpaper')
    begin
      out = `wget -nv "#{url}" -O "#{tmp.path}" 2>&1`
      unless $?.success?
        puts out
        puts '-'*60
      else
        mv(tmp.path, dest_path)
      end
    ensure
      tmp.unlink
    end
  end
end
