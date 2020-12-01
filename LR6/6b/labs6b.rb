# frozen_string_literal: true

def find_series
  Enumerator.new do |yielder|
    counter = 0
    loop do
      counter += 1
      sum = func(counter)
      yielder << sum
    end
  end
end

# :reek:UtilityFunction
def func(k_num)
  (1...k_num).to_a.reduce(0) { |acc, el| acc + (1.0 / ((2 * el - 1) * (2 * el + 1)).to_f) }
end

def answer(eps)
  find_series.find { |current_series| (current_series - 0.5).abs <= eps }
end
