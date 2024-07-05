ActiveAdmin.register Deal do
  permit_params :serial,
    service_deals_attributes: [
      :id,
      :service_id
    ],
    worker_deals_attributes: [
      :id,
      :worker_id
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
    end
  end
end
