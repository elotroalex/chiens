# Wax Tasks

spec = Gem::Specification.find_by_name 'wax_tasks'
Dir.glob("#{spec.gem_dir}/lib/tasks/*.rake").each {|r| load r}

# Publishing the Website

desc 'Publishing the website via rsync'


task :prod do
  puts 'First, let\'s build your site...'
  sh "jekyll build"
  puts "\n"
  puts 'Now let\'s publish it, hold on a sec...'
# personal server setup
  user = 'agil'
  server = 'elotroalex.com'
  path = '/home/agil/cesaire.elotroalex.com/chiens/' 
  sh "rsync -a -r -e \"ssh -p22\" _site/. #{user}@#{server}:#{path}"
  puts "\n"
  puts 'Bam! Your website is now published!'
  puts "\n"
end
