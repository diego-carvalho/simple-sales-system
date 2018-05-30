require_relative 'pessoa'

class Cliente < Pessoa
    attr_accessor :rg, :data_de_nascimento

    def to_s
        return "Cliente [rg= #{@rg}, data_de_nascimento= #{@data_de_nascimento.strftime('%d %b %Y')}, #{super.to_s}]"
    end

    def to_str
        return to_s.join(', ')
    end

end