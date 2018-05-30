require_relative '../view-framework/menu'
require_relative 'clienteView'
require_relative 'produtoView'
require_relative 'vendaView'


class LojaView

    def self.show
        lojaMenu = Menu.new("Menu Principal")
        clienteAction = ClienteView.new
        produtoAction = ProdutoView.new
        vendaAction = VendaView.new

        lojaMenu.addAction(clienteAction)
        lojaMenu.addAction(produtoAction)
        lojaMenu.addAction(vendaAction)
        lojaMenu.runAction()
    end

end