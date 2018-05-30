require_relative '../../Controller/vendaController'


class RemoverVenda
    attr_accessor :vendaController
    
    def initialize
        @vendaController = VendaController.instance
    end

    def getTitle
        return "Remover uma venda"
    end

    def runAction
        verifica = true
        while(verifica) do
            begin
                puts "Digite o numero da venda que deseja remover:"
                numero = Integer(gets.chomp)
                verifica = false
            rescue Exception => e
                puts "Numero de venda permite apenas numeros, tente novamente."
            end
        end
        pos = @vendaController.findByNumero(numero)
        if pos == -1
            puts "Venda não encontrada, por favor tente novamente."
        else
            @vendaController.removeVenda(pos)
        end
        return true
    end
end