File.open("./CasosPrueba.txt") do |file|
    file.readlines.each do |line|
        id, fn, values, result = line.chomp.split(':')
        p id, fn, values.chomp.split(",").map{|v| v.to_f}, result.to_f
    end
end