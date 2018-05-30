require_relative '../../Model/cliente'
require_relative '../../Controller/clienteController'
require 'date'


class AlterarCliente
    attr_accessor :clienteController
    
    def initialize
        @clienteController = ClienteController.instance
    end
    
    def getTitle
        return "Alterar um cliente"
    end

    def runAction
        arguments = showEdita
		if (arguments['cliente'] != nil && arguments['pos'] != -1)
			@clienteController.editarCliente(arguments)
        end
		return true;
    end

    def showEdita
        cliente = Cliente.new
        puts "Digite o rg do cliente que deseja editar:"
        old_rg = gets.chomp
        pos = @clienteController.findByRg(old_rg)
        if pos == -1
            puts "Cliente não encontrado, por favor tente novamente."
            arguments = Hash.new
            arguments['cliente'] = nil
            arguments['pos'] = pos
            return arguments
        end
        puts "Informe o novo nome:"
        cliente.nome=gets.chomp
        puts "Informe o novo endereco:"
        cliente.endereco=gets.chomp
        verifica = true
        while(verifica) do
            puts "Informe o novo rg:"
            rg = gets.chomp
            if rg == old_rg
                cliente.rg=rg
                verifica = false
            elsif @clienteController.findByRg(rg) != -1
                puts "Ja possuimos clientes com esse RG, tente novamente."
                verifica = true
            else
                cliente.rg=rg
                verifica = false
            end
        end
        verifica = true
        while(verifica) do
            begin
                puts "Informe a nova data de nascimento no formato ##/##/####:"
                data = Date.strptime(gets.chomp, '%d/%m/%Y')
                verifica = false
            rescue ArgumentError => e
                puts "Erro ao inserir o formato da data, tente novamente."
            end
        end
        cliente.data_de_nascimento= data
        arguments = Hash.new
        arguments['cliente'] = cliente
        arguments['pos'] = pos
		return arguments
    end

end