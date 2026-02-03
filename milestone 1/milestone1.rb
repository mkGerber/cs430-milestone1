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

# EVALUATOR VISITOR


class Evaluator
    def visit_int(node)
        node
    end

    def visit_float(node)
        node
    end

    def visit_bool(node)
        node
    end

    def visit_string(node)
        node
    end

    def visit_null(node)
        node
    end

    def visit_add(node)
        left_value = node.left.visit(self)
        right_value = node.right.visit(self)
        # ADD TWO INTS -> return an int
        if left_value.is_a?(IntegerPrimitive) && right_value.is_a?(IntegerPrimitive)
            IntegerPrimitive.new(left_value.raw_value + right_value.raw_value)
        # ADD TWO FLOATS -> return a float
        elsif left_value.is_a?(FloatPrimitive) && right_value.is_a?(FloatPrimitive)
            FloatPrimitive.new(left_value.raw_value + right_value.raw_value)
        # WHAT DID YOU EVEN TRY TO ADD???
        else
            raise "TypeError: Unsupported operand types for +: #{left_value.class} and #{right_value.class}"
        end
    end

    def visit_subtract(node)
        left_value = node.left.visit(self)
        right_value = node.right.visit(self)
        # SUBTRACT TWO INTS -> return an int
        if left_value.is_a?(IntegerPrimitive) && right_value.is_a?(IntegerPrimitive)
            IntegerPrimitive.new(left_value.raw_value - right_value.raw_value)
        # SUBTRACT TWO FLOATS -> return a float
        elsif left_value.is_a?(FloatPrimitive) && right_value.is_a?(FloatPrimitive)
            FloatPrimitive.new(left_value.raw_value - right_value.raw_value)
        # WHAT DID YOU EVEN TRY TO SUBTRACT???
        else
            raise "TypeError: Unsupported operand types for -: #{left_value.class} and #{right_value.class}"
        end
    end

    def visit_multiply(node)
        left_value = node.left.visit(self)
        right_value = node.right.visit(self)
        # MULTIPLY TWO INTS -> return an int
        if left_value.is_a?(IntegerPrimitive) && right_value.is_a?(IntegerPrimitive)
                IntegerPrimitive.new(left_value.raw_value * right_value.raw_value)
        # MULTIPLY TWO FLOATS -> return a float
        elsif left_value.is_a?(FloatPrimitive) && right_value.is_a?(FloatPrimitive)
            FloatPrimitive.new(left_value.raw_value * right_value.raw_value)
        # WHAT DID YOU EVEN TRY TO MULTIPLY???
        else
            raise "TypeError: Unsupported operand types for *: #{left_value.class} and #{right_value.class}"
        end
    end

    def visit_divide(node)
        left_value = node.left.visit(self)
        right_value = node.right.visit(self)
        # DIVIDE TWO INTS -> return an int
        if left_value.is_a?(IntegerPrimitive) && right_value.is_a?(IntegerPrimitive)
            IntegerPrimitive.new(left_value.raw_value / right_value.raw_value)
        # DIVIDE TWO FLOATS -> return a float
        elsif left_value.is_a?(FloatPrimitive) && right_value.is_a?(FloatPrimitive)
            FloatPrimitive.new(left_value.raw_value / right_value.raw_value)
        # WHAT DID YOU EVEN TRY TO DIVIDE???
        else
            raise "TypeError: Unsupported operand types for /: #{left_value.class} and #{right_value.class}"
        end
    end

    def visit_mod(node)
        left_value = node.left.visit(self)
        right_value = node.right.visit(self)
        # MOD TWO INTS -> return an int
        if left_value.is_a?(IntegerPrimitive) && right_value.is_a?(IntegerPrimitive)
            IntegerPrimitive.new(left_value.raw_value % right_value.raw_value)
        # MOD TWO FLOATS -> return a float
        elsif left_value.is_a?(FloatPrimitive) && right_value.is_a?(FloatPrimitive)
            FloatPrimitive.new(left_value.raw_value % right_value.raw_value)
        # WHAT DID YOU EVEN TRY TO MOD???
        else
            raise "TypeError: Unsupported operand types for %: #{left_value.class} and #{right_value.class}"
        end
    end

    def visit_exponentiate(node)
        left_value = node.left.visit(self)
        right_value = node.right.visit(self)
        # EXPONENTIATE TWO INTS -> return an int
        if left_value.is_a?(IntegerPrimitive) && right_value.is_a?(IntegerPrimitive)
            IntegerPrimitive.new(left_value.raw_value ** right_value.raw_value)
        else
            raise "TypeError: Unsupported operand types for **: #{left_value.class} and #{right_value.class}"
        end
    end

    def 

end