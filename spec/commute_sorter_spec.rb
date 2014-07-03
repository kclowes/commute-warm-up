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
      "Elsa" => [
        {
          week: 1,
          day: "Thursday",
          mode: "Drive",
          inbound: 28,
          outbound: 60,
          distance: 24
        }
      ],
      "Emily" => [
        {
          week: 4,
          day: "Monday",
          mode: "Walk",
          inbound: 12,
          outbound: 15,
          distance: 0.65
        }
      ],
    }
    expect(actual).to eq expected
  end

  it 'will add more than one entry to the end of the person\'s hash sorted by week' do
    input = [
      ['Nate', 5, 'Wednesday', 'Bus', 100, 110, 40],
      ['Emily', 5, 'Wednesday', 'Walk', 12, 15, 0.65],
      ['Elsa', 1, 'Thursday', 'Drive', 28, 60, 24],
      ['Emily', 5, 'Thursday', 'Walk', 12, 15, 0.65],
      ['Emily', 2, 'Thursday', 'Walk', 12, 15, 0.65]
    ]
    actual = CommuteSorter.new(input).sort_by_week_and_day
    expected = {
      "Elsa" => [
        {
          week: 1,
          day: "Thursday",
          mode: "Drive",
          inbound: 28,
          outbound: 60,
          distance: 24
        },
      ],
      "Emily" => [
        {
          week: 2,
          day: "Thursday",
          mode: "Walk",
          inbound: 12,
          outbound: 15,
          distance: 0.65
        },
        {
          week: 5,
          day: "Wednesday",
          mode: "Walk",
          inbound: 12,
          outbound: 15,
          distance: 0.65
        },
        {
          week: 5,
          day: "Thursday",
          mode: "Walk",
          inbound: 12,
          outbound: 15,
          distance: 0.65
        },
      ],
      "Nate" => [
        {
          week: 5,
          day: "Wednesday",
          mode: "Bus",
          inbound: 100,
          outbound: 110,
          distance: 40
        }
      ],
    }
    expect(actual).to eq expected
  end
end

