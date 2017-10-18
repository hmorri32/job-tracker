# TODO TEAL NAD BOLDD EVYERHIGNG

module DashboardHelper
  def top_three_companies
    # stuff = Job.group(:company_id)
    #            .average(:level_of_interest)
    #            .sort_by {|k,v| v}
    #            .reverse
    #            .shift(3)

    # stuff.map { |arr| Company.find(arr[0]) }

    stuff = Company.joins(:jobs)
                  .group(:id)
                  .order("avg(jobs.level_of_interest)")
                  .reverse_order
                  .limit(3)
                  .average(:level_of_interest)

    stuff.reduce({}) do |hash, stats|
      hash[Company.find(stats[0]).name] = stats[-1].to_i; hash
    end
  end

  def interest_levels
    %w(0-9 10-19 20-29 30-39 40-49 50-59 60-69 70-79 80-89 90-99 100+)
  end

  def jobs_in_level
    interest_levels.map do |level|
      if level.include?('-')
        range = level.split('-')
        Job.where(level_of_interest: [range[0].to_i..range[-1].to_i]).count
      else
        Job.where("level_of_interest >= ?", 100).count
      end
    end
  end

  def jobs_by_city
    Job.group(:city).count
  end
end