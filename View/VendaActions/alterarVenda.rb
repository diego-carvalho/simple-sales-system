require_relative '../../Model/venda'
require_relative '../../Model/itemVenda'
require_relative '../../Controller/vendaController'
require_relative '../../Controller/clienteController'
require_relative '../../Controller/produtoController'


class AlterarVenda
    attr_accessor :vendaController, :clienteController, :produtoController
    def initialize
        @vendaController = VendaController.instance
        @clienteController = ClienteController.instance
        @produtoController = ProdutoController.instance
    end
    
    def getTitle
        return "Alterar uma venda"
    end

    def runAction
        venda = showEdita
		if (venda != nil)
			puts "Modificação da venda realizada com sucesso"
        end
		return true;
    end

    def showEdita
        produto = Venda.new
        verifica = true
        while(verifica) do
            begin
                puts "Digite o numero da venda que deseja editar:"
                numero = Integer(gets.chomp)
                verifica = false
            rescue Exception => e
                puts "Numero da venda são apenas numeros, tente novamente."
            end
        end
        pos = @vendaController.findByNumero(numero)
        if pos == -1
            puts "venda não encontrada, por favor tente novamente."
            return nil
        end

        puts "Deseja editar o cliente? Digite s ou n"
        resp = gets.chomp
        while resp != 's' && resp != 'n' do
            puts "\nErro na escolha, escolha s para sim e n para não."
            puts "Deseja editar o cliente? Digite s ou n"
            resp = gets.chomp
        end
        if resp == 's'
            verifica = true
            cliente = nil
            while(verifica) do
                begin
                    puts "Digite o RG do cliente que deseja adicionar:"
                    rg = gets.chomp
                    posCliente = @clienteController.findByRg(rg)
                    if posCliente == -1
                        puts "Cliente com rg #{rg} não encontrado"
                        return nil
                    else
                        cliente = @clienteController.clientes[posCliente]
                    end
                    verifica = false
                rescue Exception => e
                    puts "Erro ao tentar encontrar o usuário com o este rg, tente novamente.\n"
                end
            end
            if cliente == nil
                return nil
            end
        end 

        puts "Deseja editar um item da venda? Digite s ou n"
        resp = gets.chomp
        while resp != 's' && resp != 'n' do
            puts "\nErro na escolha, escolha s para sim e n para não."
            puts "Deseja editar um item da venda? Digite s ou n"
            resp = gets.chomp
        end
        if resp == 's'
            verifica = true
            while(verifica) do
                cont = 0
                @vendaController.vendas[pos].itens.each do |item|
                    cont += 1
                    puts "#{cont}: #{item}"
                end

                verificaInside = true
                while(verificaInside) do
                    begin
                        puts "Digite o numero do item que deseja alterar"
                        numeroItemVenda = Integer(gets.chomp)
                        verificaInside = false
                    rescue Exception => e
                        puts "Numero da venda são apenas numeros, tente novamente."
                    end
                end

                itemVenda = nil
                itemVenda = showAdicionaItemVenda
                if itemVenda != nil
                    @vendaController.alteraItemVenda(itemVenda, pos,  numeroItemVenda - 1)
                end

                puts "Deseja editar mais um item de venda? Digite s ou n"
                resp = gets.chomp
                while resp != 's' && resp != 'n' do
                    puts "\nErro na escolha, escolha s para sim e n para não."
                    puts "Deseja editar mais um item de venda? Digite s ou n"
                    resp = gets.chomp
                end
                if resp == 'n'
                    verifica = false
                end
            end

            puts "Valor total da nova venda é: #{@vendaController.vendas[pos].getTotal}"
        end
        if cliente != nil
            @vendaController.alteraCliente(cliente, pos)
        end
        return @vendaController.vendas[pos]
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