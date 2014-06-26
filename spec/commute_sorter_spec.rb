require 'rspec'
require './lib/commute_sorter'

describe CommuteSorter do
  it 'will sort the commuters by name' do
    input = [
      ['Emily', 4, 'Monday', 'Walk', 12, 15, 0.65],
      ['Elsa', 1, 'Thursday', 'Drive', 28, 60, 24]
    ]
    actual = CommuteSorter.new(input).sort_by_name
    expected = {
      "Elsa" =>
        {
          week: 1,
          day: "Thursday",
          mode: "Drive",
          inbound: 28,
          outbound: 60,
          distance: 24
        },
      "Emily" =>
        {
          week: 4,
          day: "Monday",
          mode: "Walk",
          inbound: 12,
          outbound: 15,
          distance: 0.65
        },
    }
    expect(actual).to eq expected
  end
end