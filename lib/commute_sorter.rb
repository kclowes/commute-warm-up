class CommuteSorter
  def initialize(input)
    @input = input
  end

  def sort_by_name
    hash = Hash.new
    @input.each do |array|
      if hash.has_key?(array.first)
        hash[array.first] << {:week => array[1],
                              :day => array[2],
                              :mode => array[3],
                              :inbound => array[4],
                              :outbound => array[5],
                              :distance => array[6]}
      else
        hash[array.first] = [{:week => array[1],
                              :day => array[2],
                              :mode => array[3],
                              :inbound => array[4],
                              :outbound => array[5],
                              :distance => array[6]}]

      end
    end
    hash.sort.to_h
  end
end