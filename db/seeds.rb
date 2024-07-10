# Start new deal
deal = Deal.create!(
  serial: "#{rand(100..1000)}"
)

service = Service.create!(name: "Service 2")
deal.service_deals.create(service: service)

worker1 = Worker.create!(
  name: "Daniel Arenas",
  color: "#d382a5" 
)

worker2 = Worker.create!(
  name: "Daniel Arenas",
  color: "#dbca5c" 
)

deal.worker_deals.create!(worker: worker1)
deal.worker_deals.create!(worker: worker2)

(1..6).each do |day|
  deal.schedule_weeks.create!(
    day: day,
    from: 17,
    to: 23
  )
end
