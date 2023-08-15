namespace :db do
  desc "Load seed data into database"
  task :seed_fu do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :rails, "db:seed_fu"
        end
      end
    end
  end
end
