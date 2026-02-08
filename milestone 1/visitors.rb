# EVALUATOR VISITOR


class Evaluator
    def initialize(runtime)
        @runtime = runtime
    end

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

    def visit_rvalue(node)
        name = node.expr
        @runtime.get(name)
    end

    def visit_assign(node)
        value = node.expr.visit(self)
        @runtime.set(node.name, value)
        value
    end

    def visit_print(node)
        value = node.expr.visit(self)
        if value.is_a?(NullPrimitive)
            puts "null"
        else
            puts value.raw_value
        end
        NullPrimitive.new
    end

    def visit_block(node)
        if node.statements.length == 0
            return NullPrimitive.new
        end

        result = NullPrimitive.new

        for i in 0...node.statements.length
            result = node.statements[i].visit(self)
        end
        result
    end

    def visit_negate(node)
        value = node.left.visit(self)

        if value.is_a?(IntegerPrimitive)
            IntegerPrimitive.new(-value.raw_value)
        elsif value.is_a?(FloatPrimitive)
            FloatPrimitive.new(-value.raw_value)
        else
            raise "TypeError: Unsupported operand type for -: #{value.class}"
        end
    end

end