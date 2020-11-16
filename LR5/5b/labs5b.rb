# frozen_string_literal: true

# :reek:UtilityFunction
def correct_str(str, key)
  str_arr = str.split

  str_arr.map do |el|
    el = el.to_s
    if (el.start_with? '#') && (el.end_with? '#')
      key
    else
      el
    end
  end.join(' ')
end