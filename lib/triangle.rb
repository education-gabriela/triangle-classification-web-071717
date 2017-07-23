class Triangle
  attr_accessor :sides

  def initialize(*sides)
    @sides = sides
    self.kind
  end

  def kind
    valid_triangle?
    unique = self.sides.uniq.count

    if unique == 1
      return :equilateral
    elsif unique == 2
      return :isosceles
    end

    :scalene
  end

  def has_below_zero?
    self.sides.any? do |side|
      side <= 0
    end
  end

  def invalid_side_sum?
    sides.any? do |side|
      side >= self.sides.reduce(:+) - side
    end
  end

  def invalid_number_of_sides?
    self.sides.length != 3
  end

  def valid_triangle?
    if has_below_zero? || invalid_side_sum? || invalid_number_of_sides?
      raise TriangleError
    end
    true
  end
end

class TriangleError < StandardError
  def message
    "this is not a valid triangle"
  end
end
