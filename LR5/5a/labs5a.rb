# frozen_string_literal: true

# :reek:UtilityFunction
# math function
class MathFunc
  def func(arg_x, arg_z)
    arg_a = arg_x * (Math.cos(arg_z) + Math.exp(-(arg_x + 3)))
    arg_a.round(8)
  end
end
