require_relative '../../Model/cliente'
require_relative '../../Controller/clienteController'
require 'date'


class IncluirCliente
    attr_accessor :clienteController

    def initialize
        @clienteController = ClienteController.instance
    end

    def getTitle
        return "Incluir um cliente"
    end

    def runAction
        cliente = showAdiciona
        @clienteController.adicionarCliente(cliente)
        return true
    end

    def showAdiciona
        cliente = Cliente.new
        puts "Informe o nome:"
        cliente.nome=gets.chomp
        puts "Informe o endereco:"
        cliente.endereco=gets.chomp
        verifica = true
        while(verifica) do
            puts "Informe o rg:"
            rg = gets.chomp
            if @clienteController.findByRg(rg) != -1
                puts "Ja possuimos clientes com esse RG, tente novamente."
            else
                cliente.rg=rg
                verifica = false
            end
        end
        verifica = true
        while(verifica) do
            begin
                puts "Informe a data de nascimento no formato ##/##/####:"
                data = Date.strptime(gets.chomp, '%d/%m/%Y')
                verifica = false
            rescue ArgumentError => e
                puts "Erro ao inserir o formato da data, tente novamente."
            end
        end
        cliente.data_de_nascimento= data
		return cliente
    end
    
end