require 'faker'

namespace :admin  do
  desc "create some fake data"
  task :fake_people => :environment do
    print "How many fake lang do you want?"
    num_people = $stdin.gets.to_i
    num_people.times do
      Language.create(:name => Faker::Name.name,
                    :code => Faker::Name.name)
    end
    print "#{num_people} created.\n"
  end
end