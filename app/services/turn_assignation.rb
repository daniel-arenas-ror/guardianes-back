class TurnAssignation

  attr_accessor :week, :deal_id

  def initialize(week: , deal_id:)
    @week = week
    @deal_id = deal_id
  end

  def process
    workers = Deal.find(deal_id).workers

    week_turns = Turn.where(week: week)
    week_turns.update_all(worker_id: nil)

    ## Assination of turn just with one option
    week_turns.each do |turn|
      worker_id = turn.turn_availabilities.first&.worker_id
      turn.update!(worker_id: worker_id) if turn.turn_availabilities.count == 1
    end

    turns_without_assignation = week_turns.where(worker_id: nil)

    turns_by_worker = Turn.where(week: week).group(:worker_id).count
    turns_by_worker = workers.to_h {|w| [w.id, 0] }.merge(turns_by_worker)
    worker_id_least_turns = turns_by_worker.min_by { |_key, value| value }.first

    # turn_date = turns_without_assignation.distinct.pluck(:turn_date).sort.first
    turns_without_assignation.distinct.pluck(:turn_date).sort.each do |turn_date|
      turns_id = week_turns.where(turn_date: turn_date).pluck(:id)

      workers_available = TurnAvailability.where(turn_id: turns_id).pluck(:worker_id)

      workers_available.each do |worker_available|
        if worker_available == worker_id_least_turns
          week_turns
            .includes(:turn_availabilities)
            .where(
              turn_date: turn_date,
              turn_availabilities: {
                worker_id: worker_available
              }
            )
            .update!(worker_id: worker_available)
        end
      end
    end
  end
end
