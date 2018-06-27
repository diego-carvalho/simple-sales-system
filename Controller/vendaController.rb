require 'singleton'

class VendaController
    include Singleton

    attr_accessor :vendas

    @@quantidade = 0
    
    def initialize
        @vendas = Array.new
    end

    def imprimirVenda
        if @vendas.size == 0
            puts "Nenhuma venda realizada."
        else
            @vendas.each do |venda|
                puts venda
            end
        end
        puts "\n"
    end

    def adicionarVenda(venda)
        @@quantidade += 1
        venda.numero= @@quantidade
        @vendas << venda
		puts "venda realizada com sucesso."
    end

    def removeVenda(pos)
        venda = @vendas.delete_at(pos)
        puts "venda #{venda.numero} removida com sucesso."
    end

    def findByNumero(numero)
        cont = 0
        @vendas.each do |venda|
            if venda.numero == numero
                return cont
            end
            cont = cont.next
        end
        return -1
    end

    def editarVenda(arguments)
        arguments['venda'].codigo= @vendas[arguments['pos']].codigo
        puts "venda #{arguments['pos']} editado com sucesso."
        @vendas[arguments['pos']] = arguments['venda']
    end

    def alteraItemVenda(itemVenda, pos, posCliente)
        @vendas[pos].itens[posCliente] = itemVenda
    end

    def alteraCliente(cliente, pos)
        @vendas[pos].cliente= cliente
    end
end