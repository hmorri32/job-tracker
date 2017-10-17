module DashboardHelper
  def top_three_companies
    grouped = Job.group(:company_id).average(:level_of_interest)

    grouped.reduce({}) do |hash, (id, avg)|
      hash[id] = avg.round(2)
      hash
    end
  end

  def interest_levels
    %w(0-9 10-19 20-29 30-39 40-49 50-59 60-69 70-79 80-89 90-99 100+)
  end

  def jobs_in_level
    interest_levels.map do |level|
      if level.include?('-')
        range = level.split('-') # => ["0", "9"], ["10", "19"], ["20", "29"], ["30", "39"], ["40", "49"], ["50", "59"], ["60", "69"], ["70", "79"], ["80", "89"], ["90", "99"]

        Job.where(level_of_interest: [range[0].to_i..range[-1].to_i]).count
      else
        Job.where("level_of_interest >= ?", 100).count
      end
    end
  end
end