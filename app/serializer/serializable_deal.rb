class SerializableDeal < JSONAPI::Serializable::Resource
  type 'deals'

  attributes :id, :serial, :services, :workers

  attribute :weeks do
    current_week = Date.today.strftime("%U").to_i
    weeks = (current_week..(current_week + 5)).map { |i| i % 52 }
  end
end
