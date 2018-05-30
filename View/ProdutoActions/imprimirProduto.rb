require_relative '../../Model/produto'
require_relative '../../Controller/produtoController'


class ImprimirProduto
    attr_accessor :produtoController

    def initialize
        @produtoController = ProdutoController.instance
    end

    def getTitle
        return "Imprimir produtos"
    end

    def runAction
        @produtoController.imprimirProduto
        return true
    end
end