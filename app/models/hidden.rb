class Hidden

    def self.calculate(param1, expression, param2)
        eval("#{param1} #{expression} #{param2}")
    end
end