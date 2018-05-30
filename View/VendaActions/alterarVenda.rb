require_relative '../../Model/produto'
require_relative '../../Controller/produtoController'
require 'date'


class AlterarProduto
    attr_accessor :produtoController
    
    def initialize
        @produtoController = ProdutoController.instance
    end
    
    def getTitle
        return "Alterar um produto"
    end

    def runAction
        arguments = showEdita
		if (arguments['produto'] != nil && arguments['pos'] != -1)
			@produtoController.editarProduto(arguments)
        end
		return true;
    end

    def showEdita
        produto = Produto.new
        verifica = true
        while(verifica) do
            begin
                puts "Digite o codigo do produto que deseja editar:"
                codigo = Integer(gets.chomp)
                verifica = false
            rescue Exception => e
                puts "Codigo do produto são apenas numeros, tente novamente."
            end
        end
        pos = @produtoController.findByCodigo(codigo)
        if pos == -1
            puts "produto não encontrado, por favor tente novamente."
            arguments = Hash.new
            arguments['produto'] = nil
            arguments['pos'] = pos
            return arguments
        end
        puts "Informe o novo nome:"
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
        arguments = Hash.new
        arguments['produto'] = produto
        arguments['pos'] = pos
		return arguments
    end

end