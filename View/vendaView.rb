require_relative '../view-framework/menu'
Dir["View/VendaActions/*.rb"].each {|file| require_relative file.sub! "View/", "" }


class VendaView

    def getTitle
        return "Menu Venda"
    end

    def runAction
        vendaMenu = Menu.new("Menu Venda")
        imprimirVenda = ImprimirVenda.new
        incluirVenda = IncluirVenda.new
        alterarVenda = AlterarVenda.new
        removerVenda = RemoverVenda.new

        vendaMenu.addAction(imprimirVenda)
		vendaMenu.addAction(incluirVenda)
		vendaMenu.addAction(alterarVenda)
        vendaMenu.addAction(removerVenda)
		
        vendaMenu.runAction
        
        return true
    end

    def to_s
        return "Venda View Obj"
    end

end