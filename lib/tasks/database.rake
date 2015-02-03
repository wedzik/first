namespace :db do
  desc "Add number to all User records"
  task :set_user_positions => :environment do
    users = User.all;
    pos = 1;
    users.each do |user|
      user.position = pos
      pos+=1
      user.save;
    end
  end
end