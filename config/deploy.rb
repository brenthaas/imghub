set :application, 'imghub'
set :repo_url, 'git@github.com:brenthaas/imghub.git'
set :branch, 'master'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/home/apps/imghub"
set :scm, :git
set :keep_releases, 5
set :user, 'devops'

set :format, :pretty

set :default_env, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH:/opt/rbenv/shims/"
}

set :bundle_binstubs, -> { shared_path.join('bin') }

namespace :deploy do
  task :start do
    on roles(:app) do
      execute :sv, "up imghub"
    end
    # run "sudo sv up imghub"
  end
  task :stop do
    on roles(:app) do
      execute :sv, "down imghub"
    end
    # run "sudo sv down imghub"
  end
  task :restart do
    on roles(:app) do
      execute "sudo /usr/bin/env sv restart imghub"
    end
    # run "sudo sv restart imghub"
  end
  after :finishing, 'deploy:cleanup'
end
