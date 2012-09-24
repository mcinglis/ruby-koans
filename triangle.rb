# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # sides = [a,b,c].sort
  # if sides.count { |x| x <= 0 } > 0
  #   raise TriangleError, "Invalid side lengths: #{sides}"
  # elsif sides[0] + sides[1] <= sides[2]
  #   raise TriangleError, "Incompatible side lengths: #{sides}"
  # end
  # case sides.uniq.length
  # when 1 then :equilateral
  # when 2 then :isosceles
  # else :scalene
  # end

  # Better answer by looking at stackoverflow posts:
  a,b,c = [a,b,c].sort
  raise TriangleError, 'Invalid side lengths' if a + b <= c
  [:equilateral, :isosceles, :scalene][[a,b,c].uniq.size - 1]
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
