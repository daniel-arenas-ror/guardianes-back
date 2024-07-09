class TurnAssignation

  attr_accessor :turn_availability

  def initialize(turn_availability: )
    @turn_availability = turn_availability
  end

  def process
    week = turn_availability.turn.week

    turn = turn_availability.turn
    workers = turn.service_deal.deal.workers

    if turn.turn_availabilities.count == 1
      turn.update!(worker_id: turn_availability.worker_id)
      return
    end

    week_turns = Turn.where(week: week)
    turn_by_day = turns.count / 7

    ## Assination of turn just with one option
    week_turns.each do |turn|
      worker_id = turn.turn_availabilities.first.worker_id
      turn.update!(worker_id: worker_id) if turn.turn_availabilities.count == 1
    end

    turns_without_assignation = week_turns.where(worker_id: nil)

    turns_by_worker = Turn.where(week: week).group(:worker_id).count
    turns_by_worker = workers.to_h {|w| [w.id, 0] }.merge(turn_by_worker)
    worker_id_least_turns = turns_by_worker.min_by { |_key, value| value }.first

    # turn_date = turns_without_assignation.distinct.pluck(:turn_date).sort.first
    turns_without_assignation.distinct.pluck(:turn_date).sort.each do |turn_date|
      turns_id = week_turns.where(turn_date: turn_date).pluck(:id)

      workers_available = TurnAvailability.where(turn_id: turns_id).pluck(:worker_id)

      worker_available.each do |worker_available|
        if worker_available == worker_id_least_turns
          week_turns.where(turn_date: turn_date).update!(worker_id: worker_available)
        end
      end
    end
  end
end
