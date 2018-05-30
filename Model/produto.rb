class Produto
    attr_accessor :codigo, :nome, :valor

    def to_s
        return "Produto = [codigo: #{@codigo}, nome: #{@nome}, valor: #{@valor}]"
    end
end