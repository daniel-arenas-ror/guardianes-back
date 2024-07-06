namespace :turn do
  desc "Create  the turn of the next week"
  task create_turn_next_week: :environment do
    Deal.all.each do |deal|
      deal.service_deals.each do |service_deal|
        date = Date.today.next_occurring(:sunday)
        deal.schedule_weeks.each do |schedule_week|
          date = date.advance(days: 1)

          from = schedule_week.from
          to   = schedule_week.to

          (from..to).each do |hour|
            key = "#{hour}_#{date.strftime("%d_%m_%Y")}"

            Turn.create!(
              key: key,
              week: date.strftime('%-V').to_i,
              service_deal: service_deal
            )
          end
        end
      end
    end
  end
end
