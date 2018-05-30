require_relative 'totalizavel'

class Venda
    include Totalizavel

    attr_accessor :numero, :data, :cliente, :itens

    def initialize
        @itens = Array.new
    end

    def setItem(item)
        @itens << item
    end

    def getTotal
        #  spta totaç de cda item;
        valor = 0
        @itens.each do |item|
            valor = total(item.getTotal, valor) {|n, j| n + j}
        end
        return valor
    end

    def to_s
        if itens.size > 1
            return "Venda = [numero: #{@numero}, data: #{@data}, cliente: #{@cliente}, itens: #{@itens.join(', ')}]"
        else
            return "Venda = [numero: #{@numero}, data: #{@data}, cliente: #{@cliente}, itens: #{@itens.join('')}]"
        end
    end
end