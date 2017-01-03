lock "3.7.1"

set :application, "discoursehub"
set :repo_url, "git@github.com:jjaffeux/DiscourseHub.git"
set :deploy_to, "/discoursehub"

namespace :deploy do
  after :finished, :docker do
    on roles(:all) do |host|
      within "/discoursehub/current" do
        as :root  do
          execute 'sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)"'
          execute 'sudo chmod +x /usr/local/bin/docker-compose'
          execute 'sudo apt-get update'
          execute 'sudo apt-get install -y apt-transport-https ca-certificates'
          execute 'sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D'
          execute 'echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list'
          execute 'sudo apt-get update'
          execute 'sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual'
          execute 'sudo apt-get install -y docker-engine'
          execute 'docker-compose -v'
          execute 'cp /discourse_hub_env /discoursehub/current/.env'
          execute 'cd /discoursehub/current && RAILS_ENV=production RAILS_ROOT=/var/www/discoursehub docker-compose up --build -d'
        end
      end
    end
  end
end
