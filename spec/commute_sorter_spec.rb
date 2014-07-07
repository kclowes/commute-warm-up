require 'rspec'
require './lib/commute_sorter'

describe CommuteSorter do
  it 'will sort data based on name' do
    input = [['Emily', '3', 'Monday', 'Walk', '12', '15', '0.65'],
             ['Elsa', '1', 'Tuesday', 'Drive', '35', '52', '24'],
             ['Kinsey', '1', 'Thursday', 'Drive', '60', '60', '25'],
             ['Kinsey', '2', 'Monday', 'Drive', '60', '60', '25'],]

    full_sorter = CommuteSorter.new(input)
    actual = full_sorter.name_sorter

    expected = {"Elsa" =>
                  [{
                     week: '1',
                     day: "Tuesday",
                     mode: "Drive",
                     inbound: '35',
                     outbound: '52',
                     distance: '24'
                   }],
                "Emily" =>
                  [{
                     week: '3',
                     day: "Monday",
                     mode: "Walk",
                     inbound: '12',
                     outbound: '15',
                     distance: '0.65'
                   }],
                "Kinsey" =>
                  [{
                     week: '1',
                     day: "Thursday",
                     mode: "Drive",
                     inbound: '60',
                     outbound: '60',
                     distance: '25'
                   },
                   {
                     week: '2',
                     day: "Monday",
                     mode: "Drive",
                     inbound: '60',
                     outbound: '60',
                     distance: '25'
                   }]

    }

    expect(actual).to eq(expected)
  end

  it 'will sort data based on name' do
    input = [['Emily', '3', 'Monday', 'Walk', '12', '15', '0.65'],
             ['Elsa', '1', 'Tuesday', 'Drive', '35', '52', '24'],
             ['Kinsey', '1', 'Friday', 'Drive', '60', '60', '25'],
             ['Kinsey', '1', 'Thursday', 'Drive', '60', '60', '25'],
             ['Kinsey', '2', 'Monday', 'Drive', '60', '60', '25'],]

    full_sorter = CommuteSorter.new(input)
    actual = full_sorter.date_sorter

    expected = {"Elsa" =>
                  [{
                     week: '1',
                     day: "Tuesday",
                     mode: "Drive",
                     inbound: '35',
                     outbound: '52',
                     distance: '24'
                   }],
                "Emily" =>
                  [{
                     week: '3',
                     day: "Monday",
                     mode: "Walk",
                     inbound: '12',
                     outbound: '15',
                     distance: '0.65'
                   }],
                "Kinsey" =>
                  [{
                     week: '1',
                     day: "Thursday",
                     mode: "Drive",
                     inbound: '60',
                     outbound: '60',
                     distance: '25'
                   },
                   {
                     week: '1',
                     day: "Friday",
                     mode: "Drive",
                     inbound: '60',
                     outbound: '60',
                     distance: '25'
                   },
                   {
                     week: '2',
                     day: "Monday",
                     mode: "Drive",
                     inbound: '60',
                     outbound: '60',
                     distance: '25'
                   }]

    }

    expect(actual).to eq(expected)
  end
end