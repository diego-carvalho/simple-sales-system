require_relative 'totalizavel'

class ItemVenda
    include Totalizavel

    attr_accessor :produto, :valor, :quantidade

    def to_s
        return "ItemVenda = [valor: #{@valor}, quantidade: #{@quantidade}, produto: #{@produto}]"
    end

    def getTotal
        return total(@valor, @quantidade) {|n, j| n * j}
    end

    def to_str
        return to_s
    end
end