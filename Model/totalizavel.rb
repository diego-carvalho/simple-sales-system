module Totalizavel
    def total(i, j)
        valor = yield i, j
        return valor
    end
end

=begin
def totalizavel(i, j)
    valor = yield i, j
    return valor
end

puts totalizavel(2, 4) {|n, k| n * 2 + k}
=end