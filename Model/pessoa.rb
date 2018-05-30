class Pessoa
    attr_accessor :nome, :endereco

    def to_s
        return  "Pessoa = [nome: #{@nome}, endereco: #{endereco}]"
    end
end