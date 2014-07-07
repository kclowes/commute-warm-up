class CommuteSorter
  def initialize(input)
    @input = input
  end

  def name_sorter
    results = {}
    @input.each do |data_set|
      if results[data_set[0]]
        results[data_set[0]] << {week: data_set[1],
                                 day: data_set[2],
                                 mode: data_set[3],
                                 inbound: data_set[4],
                                 outbound: data_set[5],
                                 distance: data_set[6]}
      else
        results[data_set[0]] = [{week: data_set[1],
                                 day: data_set[2],
                                 mode: data_set[3],
                                 inbound: data_set[4],
                                 outbound: data_set[5],
                                 distance: data_set[6]}]
      end
    end
    results.sort.to_h
  end

  def date_sorter
    name_sorter.each do |key, value|
      value.sort_by! do |hash|
        date_sort = Date.parse(hash[:day]).wday
        [hash[:week], date_sort]
      end
    end
  end

end