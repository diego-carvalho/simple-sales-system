# require_relative '../Model/cliente'
require 'singleton'

class ClienteController
    include Singleton

    attr_accessor :clientes
    
    def initialize
        @clientes = Array.new
    end

    def imprimirCliente
        if @clientes.size == 0
            puts "Nenhum cliente adicionado."
        else
            @clientes.each do |cliente|
                puts cliente
            end
        end
        puts "\n"
    end

    def adicionarCliente(cliente)
        @clientes << cliente
		puts "cliente adicionado com sucesso."
    end
    
    def editarCliente(arguments)
        puts "cliente #{@clientes[arguments['pos']].nome} editado com sucesso."
        @clientes[arguments['pos']] = arguments['cliente']
    end

    def removeCliente(pos)
        cliente = @clientes.delete_at(pos)
        puts "cliente #{cliente.nome} removido com sucesso."
    end

    def findByRg(rg)
        cont = 0
        @clientes.each do |cliente|
            if cliente.rg == rg
                return cont
            end
            cont = cont.next
        end
        return -1
    end
end