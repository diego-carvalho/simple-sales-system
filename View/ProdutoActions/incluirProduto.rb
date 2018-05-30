require_relative '../../Model/produto'
require_relative '../../Controller/produtoController'
require 'date'


class IncluirProduto
    attr_accessor :produtoController

    def initialize
        @produtoController = ProdutoController.instance
    end

    def getTitle
        return "Incluir um produto"
    end

    def runAction
        produto = showAdiciona
        @produtoController.adicionarProduto(produto)
        return true
    end

    def showAdiciona
        produto = Produto.new
        puts "Informe o nome:"
        produto.nome=gets.chomp
        verifica = true
        while(verifica) do
            begin
                puts "Informe o valor: 10.50"
                valor = Float(gets.chomp)
                produto.valor= valor
                verifica = false
            rescue Exception => e
                puts "Erro ao inserir o formato do valor, tente novamente."
            end
        end
		return produto
    end
    
end