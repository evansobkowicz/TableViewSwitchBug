class StatesScreen < PM::TableScreen

  def on_load
    @selected_states = ['Massachusetts']
  end

  def generate_cells
    cells = []
    states.each do |state|
      val = (state == 'Alaska' || state == 'Massachusetts') ? true : false
      cells.push(
        title: state,
        selection_style: :none,
        accessory: {
          view: :switch,
          value: val,
          action: :accessory_switched,
          arguments: { name: state },
        },
      )
    end
    cells
  end

  def table_data
    [{
      title: 'States',
      cells: generate_cells,
    }]
  end

  def accessory_switched(args = {})
    @selected_states.include?(args[:name]) ? remove_from_selected(args) : add_to_selected(args)
  end

  def add_to_selected(args = {})
    @selected_states.push(args[:name])
  end

  def remove_from_selected(args = {})
    @selected_states.delete(args[:name])
  end

  def states
    [
      'Alabama',
      'Alaska',
      'Arizona',
      'Arkansas',
      'California',
      'Colorado',
      'Connecticut',
      'Delaware',
      'District of Columbia',
      'Florida',
      'Georgia',
      'Hawaii',
      'Idaho',
      'Illinois',
      'Indiana',
      'Iowa',
      'Kansas',
      'Kentucky',
      'Louisiana',
      'Maine',
      'Maryland',
      'Massachusetts',
      'Michigan',
      'Minnesota',
      'Mississippi',
      'Missouri',
      'Montana',
      'Nebraska',
      'Nevada',
      'New Hampshire',
      'New Jersey',
      'New Mexico',
      'New York',
      'North Carolina',
      'North Dakota',
      'Ohio',
      'Oklahoma',
      'Oregon',
      'Pennsylvania',
      'Rhode Island',
      'South Carolina',
      'South Dakota',
      'Tennessee',
      'Texas',
      'Utah',
      'Vermont',
      'Virginia',
      'Washington',
      'West Virginia',
      'Wisconsin',
      'Wyoming',
    ]
  end

end
