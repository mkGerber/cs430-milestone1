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