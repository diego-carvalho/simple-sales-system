require_relative '../../Model/cliente'
require_relative '../../Controller/clienteController'


class ImprimirCliente
    attr_accessor :clienteController

    def initialize
        @clienteController = ClienteController.instance
    end

    def getTitle
        return "Imprimir clientes"
    end

    def runAction
        @clienteController.imprimirCliente
        return true
    end
end