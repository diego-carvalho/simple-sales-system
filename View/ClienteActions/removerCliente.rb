require_relative '../../Controller/clienteController'


class RemoverCliente
    attr_accessor :clienteController
    
    def initialize
        @clienteController = ClienteController.instance
    end

    def getTitle
        return "Remover um cliente"
    end

    def runAction
        puts "Digite o rg do cliente que deseja excluir:"
        rg = gets.chomp
        pos = @clienteController.findByRg(rg)
        if pos == -1
            puts "Cliente não encontrado, por favor tente novamente."
        else
            @clienteController.removeCliente(pos)
        end
        return true
    end
end