lock "3.7.1"

set :application, "discoursehub"
set :repo_url, "git@github.com:jjaffeux/DiscourseHub.git"
set :deploy_to, "/discoursehub"

namespace :deploy do
  after :finished, :foo do
    on roles(:all) do |host|
      within "/discoursehub/current" do
        as :root  do
          execute 'sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)"'
          execute 'sudo chmod +x /usr/local/bin/docker-compose'
          execute 'docker-compose -v'
          execute 'pwd'
          execute 'RAILS_ENV=production RAILS_ROOT=/var/www/discoursehub docker-compose up --build -d'
        end
      end
    end
  end
end
