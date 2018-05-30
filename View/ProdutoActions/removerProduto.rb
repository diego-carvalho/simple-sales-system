require_relative '../../Controller/produtoController'


class RemoverProduto
    attr_accessor :produtoController
    
    def initialize
        @produtoController = ProdutoController.instance
    end

    def getTitle
        return "Remover um produto"
    end

    def runAction
        verifica = true
        while(verifica) do
            begin
                puts "Digite o codigo do produto que deseja excluir:"
                codigo = Integer(gets.chomp)
                verifica = false
            rescue Exception => e
                puts "Codigo do produto são apenas numeros, tente novamente."
            end
        end
        pos = @produtoController.findByCodigo(codigo)
        if pos == -1
            puts "Produto não encontrado, por favor tente novamente."
        else
            @produtoController.removeProduto(pos)
        end
        return true
    end
end