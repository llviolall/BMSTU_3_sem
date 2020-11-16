# frozen_string_literal: true

def find_series(eps = 1e-4)
  steps = 0
  sum = 0
  loop do
    steps += 1
    sum = func(steps)
    break if (0.5 - sum).abs <= eps
  end
  [sum, steps]
end

# :reek:UtilityFunction
def func(k_num)
  (1...k_num).to_a.reduce(0) { |acc, el| acc + (1.0 / ((2 * el - 1) * (2 * el + 1)).to_f) }
end
