# require_relative '../Model/produto'
require 'singleton'

class ProdutoController
    include Singleton

    attr_accessor :produtos

    @@quantidade = 0
    
    def initialize
        @produtos = Array.new
    end

    def imprimirProduto
        if @produtos.size == 0
            puts "Nenhum produto adicionado."
        else
            @produtos.each do |produto|
                puts produto
            end
        end
        puts "\n"
    end

    def adicionarProduto(produto)
        @@quantidade += 1
        produto.codigo= @@quantidade
        @produtos << produto
		puts "produto adicionado com sucesso."
    end
    
    def editarProduto(arguments)
        puts arguments['produto']
        arguments['produto'].codigo= @produtos[arguments['pos']].codigo
        puts "produto #{@produtos[arguments['pos']].nome} editado com sucesso."
        @produtos[arguments['pos']] = arguments['produto']
    end

    def removeProduto(pos)
        produto = @produtos.delete_at(pos)
        puts "produto #{produto.nome} removido com sucesso."
    end

    def findByCodigo(codigo)
        cont = 0
        @produtos.each do |produto|
            if produto.codigo == codigo
                return cont
            end
            cont = cont.next
        end
        return -1
    end
end