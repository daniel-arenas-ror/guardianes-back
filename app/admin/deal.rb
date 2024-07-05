ActiveAdmin.register Deal do
  permit_params :serial,
    service_deals_attributes: [
      :id,
      :service_id
    ],
    worker_deals_attributes: [
      :id,
      :worker_id
    ],
    schedule_weeks_attributes: [
      :id, :day, :from, :to
    ]

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names

    f.input :serial
    f.has_many :service_deals do |t|
      t.input :service
    end

    f.has_many :worker_deals do |t|
      t.input :worker
    end

    f.has_many :schedule_weeks do |t|
      t.input :day, as: :select, collection: [["Lunes", 1], ["Martes", 2], ["Miercoles", 3], ["Jueves", 4], ["Viernes", 5], ["Sabado", 6], ["Domingo", 0]]
      t.input :from, type: :number, min: 0, max: 23
      t.input :to, type: :number, min: 0, max: 23
    end

    f.actions
  end

  show do
    attributes_table do
      row :serial

      table_for deal.service_deals do
        column "Services" do |service_deal|
          link_to service_deal.name, [ :admin, service_deal.service ]
        end
      end

      table_for deal.worker_deals do
        column "Worker" do |worker_deal|
          link_to worker_deal.name, [ :admin, worker_deal.worker ]
        end
      end

      table_for deal.schedule_weeks do
        column "Schedule weeks" do |scheduled|
          p scheduled
        end
      end
    end
  end
end
