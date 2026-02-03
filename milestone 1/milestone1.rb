class AstNode

end

# FIVE PRIMITIVES

class IntegerPrimitive
    attr_reader :raw_value

    def initialize(raw_value)
        @raw_value = raw_value
    end 

    def visit(visitor)
        visitor.visit_int(self)
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

class equals 
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
    def visit_int(node)
        node.raw_value.to_s
    end

    def visit_float(node)
        node.raw_value
    end
end