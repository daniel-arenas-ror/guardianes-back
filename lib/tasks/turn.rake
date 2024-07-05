namespace :turn do
  desc "Create  the turn of the next week"
  task create_turn_next_week: :environment do
    Deal.all.each do |deal|
      
    end
  end
end
