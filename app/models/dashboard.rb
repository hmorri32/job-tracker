class Dashboard
  def self.top_three_companies
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

    stuff.reduce({}) { |hash, stats| hash[Company.find(stats[0]).name] = stats[-1].to_i; hash }
  end

  def self.build_range
    %w(0-9 10-19 20-29 30-39 40-49 50-59 60-69 70-79 80-89 90-99 100+)
  end

  def self.jobs
    build_range.map do |level|
      case
      when level.include?('-')
        Job.where(level_of_interest: [level.split('-')[0].to_i..level.split('-')[-1].to_i]).count
      else
        Job.where("level_of_interest >= ?", 100).count
      end
    end
  end

  def self.jobs_by_city
    Job.group(:city)
       .order("count_id DESC")
       .count(:id)
  end
end