class CommuteSorter
  def initialize(input)
    @input = input
  end

  def sort_by_name
    hash = Hash.new
    @input.each do |array|
      hash[array.first] = {:week => array[1],
                           :day => array[2],
                           :mode => array[3],
                           :inbound => array[4],
                           :outbound => array[5],
                           :distance => array[6]}
    end
    hash
  end
end