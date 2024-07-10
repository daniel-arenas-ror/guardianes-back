namespace :turn do
  desc "Create  the turn of the next week"
  task create_turn_next_week: :environment do
    Deal.all.each do |deal|
      deal.service_deals.each do |service_deal|
        (0..5).each do |week|
          date = Date.today + week.weeks
          deal.schedule_weeks.each do |schedule_week|
            date = date.advance(days: 1)

            from = schedule_week.from
            to   = schedule_week.to

            (from..to).each do |hour|
              key = "#{hour}_#{date.strftime("%d_%m_%Y")}"

              turn = Turn.new(
                key: key,
                turn_date: date,
                hour: hour,
                week: date.strftime('%-V').to_i,
                service_deal: service_deal
              )

              turn.save
            end
          end
        end
      end
    end
  end
end
