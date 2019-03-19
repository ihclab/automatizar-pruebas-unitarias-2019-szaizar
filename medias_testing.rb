File.open("./CasosPrueba.txt") do |file|
    file.readlines.each do |line|
        p line.chomp
    end
end