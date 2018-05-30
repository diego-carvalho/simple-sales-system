require_relative '../view-framework/menu'
Dir["View/ProdutoActions/*.rb"].each {|file| require_relative file.sub! "View/", "" }


class ProdutoView

    def getTitle
        return "Menu Produto"
    end

    def runAction
        produtoMenu = Menu.new("Menu Produto")
        imprimirProduto = ImprimirProduto.new
        incluirProduto = IncluirProduto.new
        alterarProduto = AlterarProduto.new
        removerProduto = RemoverProduto.new

        produtoMenu.addAction(imprimirProduto)
		produtoMenu.addAction(incluirProduto)
		produtoMenu.addAction(alterarProduto)
        produtoMenu.addAction(removerProduto)
		
        produtoMenu.runAction
        
        return true
    end

    def to_s
        return "Produto View Obj"
    end

end