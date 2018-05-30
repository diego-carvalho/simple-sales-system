require_relative '../view-framework/menu'
Dir["View/ClienteActions/*.rb"].each {|file| require_relative file.sub! "View/", "" }


class ClienteView

    def getTitle
        return "Menu Cliente"
    end

    def runAction
        clienteMenu = Menu.new("Menu Cliente")
        imprimirCliente = ImprimirCliente.new
        incluirCliente = IncluirCliente.new
        alterarCliente = AlterarCliente.new
        removerCliente = RemoverCliente.new

        clienteMenu.addAction(imprimirCliente)
		clienteMenu.addAction(incluirCliente)
		clienteMenu.addAction(alterarCliente)
        clienteMenu.addAction(removerCliente)
		
        clienteMenu.runAction
        
        return true
    end

    def to_s
        return "Cliente View Obj"
    end

end