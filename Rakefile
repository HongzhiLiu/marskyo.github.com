task :default => :generate


module Helper
  def self.make_uuid
    "uuid: " + (0..16).to_a.map{|a| rand(16).to_s(16)}.join + "\r\n"
  end

  def self.replace_uuid(content)
    # --- --- 之间搜
    io = ::StringIO.new(content) 
    find = 0
    max = 0
    while line = io.gets
      break if line =~ /^uuid:/
      break if max > 10
      if line =~ /^---/
        find += 1
      end
      if find == 2
        break
      end
      max += 1
    end

    s = StringIO.new 
    if find == 2
      io.rewind

      while line = io.gets
        s.write(self.make_uuid) if max == 0
        s.write(line)
        max -= 1
      end
    end 
    s.string
  end
end

desc "add a guid"
task :guid do
  Dir["_posts/*.markdown"].each do |x|
    content = Helper.replace_uuid File.open(x).read 
    if content && content.length >10
      File.open(x, 'w') do |f|
        f.write(content)
      end
    end
  end
end

desc 'Create new post with rake "post[post-name]"'
task :post, [:title] do |t, args|
  if args.title then
    new_post(args.title)
  else
    puts 'rake "post[post-name]"'
  end
end

desc 'Build site with Jekyll'
task :generate => [:clean, :scss] do
  `jekyll build`
end

desc 'Generate css'
task :scss do
  `scss media/css/style.scss media/css/style.css`
end

desc 'Start server'
task :server => [:clean, :scss] do
  `jekyll serve -t`
end


desc 'Deploy with rake "depoly[comment]"'
task :push, [:comment] => :generate do |t, args|
  Dir.chdir(File.expand_path('../_site',__FILE__)) do
    %x[git init]
    %x[git add -A]
    %x[git remote add origin git@github.com:hhuai/hhuai.github.com.git ]
    %x[git commit -am '#{args.comment ? args.comment : 'new push'}']
    %x[git push origin master -f]
  end
end

desc 'Deploy with rake "depoly[comment]"'
task :deploy, [:comment] => :generate do |t, args|
  if args.comment then
    `git commit . -m '#{args.comment}' && git push`
  else
    `git commit . -m 'new deployment' && git push`
  end
end

desc 'Clean up'
task :clean do
  `rm -rf _site`
end

def new_post(title)
  time = Time.now
  filename = "_posts/" + time.strftime("%Y-%m-%d-") + title + '.markdown'
  if File.exists? filename then
    puts "Post already exists: #{filename}"
    return
  end
  uuid = `uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "\n"`
  File.open(filename, "wb") do |f|
    f << <<-EOS
---
title: #{title}
layout: post
guid: urn:uuid:#{uuid}
tags:
  - 
---


EOS
  %x[echo "#{filename}" | pbcopy]
  end
  puts "created #{filename}"
  `git add #{filename}`
end
