require_relative '../../Model/venda'
require_relative '../../Model/itemVenda'
require_relative '../../Controller/vendaController'
require_relative '../../Controller/clienteController'
require_relative '../../Controller/produtoController'
require 'date'


class IncluirVenda
    attr_accessor :vendaController, :clienteController, :produtoController

    def initialize
        @vendaController = VendaController.instance
        @clienteController = ClienteController.instance
        @produtoController = ProdutoController.instance
    end

    def getTitle
        return "Incluir uma venda"
    end

    def runAction
        venda = showAdiciona
        if venda != nil
            puts "Valor total da venda é: #{venda.getTotal}"
            @vendaController.adicionarVenda(venda)
        end
        return true
    end

    def showAdiciona
        venda = Venda.new
        verifica = true
        cliente = nil
        while(verifica) do
            begin
                puts "Digite o RG do cliente que deseja adicionar:"
                rg = gets.chomp
                pos = @clienteController.findByRg(rg)
                if pos == -1
                    puts "Cliente com rg #{rg} não encontrado"
                    return nil
                else
                    cliente = @clienteController.clientes[pos]
                end
                verifica = false
            rescue Exception => e
                puts "Erro ao tentar encontrar o usuário com o este rg, tente novamente.\n"
            end
        end
        if cliente != nil
            venda.cliente= cliente
        else
            return nil
        end
        verifica = true
        itemVenda = nil
        while(verifica) do
            puts "Adicionar um item de venda"
            itemVenda = showAdicionaItemVenda
            if itemVenda != nil
                venda.setItem(itemVenda)

                puts "Deseja adicionar mais um item de venda? Digite s ou n"
                resp = gets.chomp
                while resp != 's' && resp != 'n' do
                    puts "\nErro na escolha, escolha s para sim e n para não."
                    puts "Deseja adicionar mais um item de venda? Digite s ou n"
                    resp = gets.chomp
                end
                if resp == 'n'
                    verifica = false
                end 

            else
                puts "Erro ao adicionar Item, por favor tente novamente\n"
            end
        end
        venda.data= Date.strptime( DateTime.now.strftime("%d/%m/%Y"), '%d/%m/%Y')
        return venda
    end

    def showAdicionaItemVenda
        item = ItemVenda.new
        verifica = true
        produto = nil
        while(verifica) do
            begin
                puts "Digite o codigo do produto que deseja adicionar:"
                codigo = Integer(gets.chomp)
                pos = @produtoController.findByCodigo(codigo)
                if pos == -1
                    puts "Produto com codigo #{codigo} não encontrado"
                    return nil
                else
                    produto = @produtoController.produtos[pos]
                end
                verifica = false
            rescue Exception => e
                puts "Codigo do produto são apenas numeros, tente novamente."
            end
        end
        item.produto= produto
        verifica = true
        while(verifica) do
            begin
                puts "Informe a quantidade:"
                item.quantidade= Integer(gets.chomp)
                verifica = false
            rescue Exception => e
                puts "Quantidade precisa ser em numeros, tente novamente."
            end
        end
        item.valor= produto.valor
        return item
    end
end