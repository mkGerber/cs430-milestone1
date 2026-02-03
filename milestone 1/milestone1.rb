#include 'visitors.rb'
require_relative 'visitors'

# FIVE PRIMITIVES

class IntegerPrimitive
    attr_reader :raw_value

    def initialize(raw_value)
        @raw_value = raw_value
    end 

    def visit(visitor)
        visitor.visit_int(self)
    end
end

class FloatPrimitive
    attr_reader :raw_value

    def initialize(raw_value)
        @raw_value = raw_value
    end 

    def visit(visitor)
        visitor.visit_float(self)
    end
end

class BoolPrimitive
    attr_reader :raw_value

    def initialize(raw_value)
        @raw_value = raw_value
    end 

    def visit(visitor)
        visitor.visit_bool(self)
    end
end

class StringPrimitive
    attr_reader :raw_value

    def initialize(raw_value)
        @raw_value = raw_value
    end 

    def visit(visitor)
        visitor.visit_string(self)
    end
end

class NullPrimitive
    def visit(visitor)
        visitor.visit_null(self)
    end
end

# SEVEN ARITHMETIC OPERATIONS

class Add
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end 

    def visit(visitor)
        visitor.visit_add(self)
    end
end

class Subtract
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_subtract(self)
    end
end

class Multiply 
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end 

    def visit(visitor)
        visitor.visit_multiply(self)
    end
end

class Divide
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_divide(self)
    end
end

class Mod
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_mod(self)
    end
end

class Exponentiate
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_exponentiate(self)
    end
end

class Negate
    attr_reader :left

    def initialize(left)
        @left = left
    end

    def visit(visitor)
        visitor.visit_negate
    end
end

# THREE LOGICAL OPERATIONS

class LogicalAnd
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_logical_and(self)
    end
end

class LogicalOr 
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_logical_or(self)
    end
end

class LogicalNot 
    attr_reader :left

    def initialize(left)
        @left = left
    end

    def visit(visitor)
        visitor.visit_logical_not(self)
    end
end

# SIX BITWISE OPERATIONS

class BitwiseAnd 
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_bitwise_and(self)
    end
end

class BitwiseOr 
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_bitwise_or(self)
    end
end

class BitwiseXor 
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_bitwise_xor(self)
    end
end

class BitwiseNot 
    attr_reader :left

    def initialize(left)
        @left = left
    end

    def visit(visitor)
        visitor.visit_not(self)
    end
end

class BitwiseLeftShift 
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_bitwise_left_shift(self)
    end
end

class BitwiseRightShift 
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_bitwise_right_shift(self)
    end
end

# SIX RELATIONAL OPERATIONS

class Equals 
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_equals(self)
    end
end

class NotEquals 
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_not_equals(self)
    end
end

class LessThan 
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_less_than(self)
    end
end

class LessThanOrEqual 
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_less_than_or_equal(self)
    end
end

class GreaterThan 
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_greater_than(self)
    end
end

class GreaterThanOrEqual 
    attr_reader :left, :right

    def initialize(left, right)
        @left = left
        @right = right
    end

    def visit(visitor)
        visitor.visit_greater_than_or_equal(self)
    end
end

# TWO CASTING OPERATORS

class IntToFloat
  attr_reader :expr

  def initialize(expr)
    @expr = expr
  end

  def visit(visitor)
    visitor.visit_int_to_float(self)
  end
end

class FloatToInt
  attr_reader :expr

  def initialize(expr)
    @expr = expr
  end

  def visit(visitor)
    visitor.visit_float_to_int(self)
  end
end

## R-VALUE

class Rvalue 
    attr_reader :expr

    def initialize(expr)
        @expr = expr
    end

    def visit(visitor)
        visitor.visit_rvalue(self)
    end
end




class Translator
    #PRIMITIVES 

    def visit_int(node)
        node.raw_value.to_s
    end

    def visit_float(node)
        node.raw_value.to_s
    end

    def visit_bool(node)
        node.raw_value.to_s
    end

    def visit_string(node)
        node.raw_value
    end

    def visit_null(node)
        "Null"
    end

    ## ARITHMETIC OPERATIONS

    def visit_add(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} + #{right_translation}"
    end

    def visit_subtract(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} - #{right_translation}"
    end

    def visit_multiply(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} * #{right_translation}"
    end

    def visit_divide(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} / #{right_translation}"
    end

    def visit_mod(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} % #{right_translation}"
    end

    def visit_exponentiate(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} ^ #{right_translation}"
    end

    def visit_Negate(node)
        left_translation = node.left.visit(self)
        "-#{left_translation}"
    end

    def visit_logical_and(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} && #{right_translation}"
    end

    def visit_logical_or(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} || #{right_translation}"
    end

    def visit_logical_not(node)
        left_translation = node.left.visit(self)
        "!#{left_translation}"
    end

    def visit_bitwise_and(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} & #{right_translation}"
    end

    def visit_bitwise_or(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} | #{right_translation}"
    end

    def visit_bitwise_xor(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} ^ #{right_translation}"
    end

    def visit_bitwise_not(node)
        left_translation = node.left.visit(self)
        "~#{left_translation}"
    end

    def visit_bitwise_left_shift(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} << #{right_translation}"
    end

    def visit_bitwise_right_shift(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} >> #{right_translation}"
    end

    def visit_equals(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} == #{right_translation}"
    end

    def visit_not_equals(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} != #{right_translation}"
    end

    def visit_less_than(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} < #{right_translation}"
    end

    def visit_less_than_or_equal(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} <= #{right_translation}"
    end

    def visit_greater_than(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} > #{right_translation}"
    end

    def visit_greater_than_or_equal(node)
        left_translation = node.left.visit(self)
        right_translation = node.right.visit(self)
        "#{left_translation} >= #{right_translation}"
    end

    def visit_int_to_float(node)
        expr_translation = node.expr.visit(self)
        "Float(#{expr_translation})"
    end

    def visit_float_to_int(node)
        expr_translation = node.expr.visit(self)
        "Int(#{expr_translation})"
    end

    # RVALUE?? figure that out idk

end 




myInt = IntegerPrimitive.new(5)
myInt2 = IntegerPrimitive.new(10)
myFloat = FloatPrimitive.new(3.2)
mySum = Add.new(myInt, myInt2)
p mySum.visit(Translator.new)
