require_relative '../../Model/venda'
require_relative '../../Controller/vendaController'


class ImprimirVenda
    attr_accessor :vendaController

    def initialize
        @vendaController = VendaController.instance
    end

    def getTitle
        return "Imprimir vendas"
    end

    def runAction
        @vendaController.imprimirVenda
        return true
    end
end