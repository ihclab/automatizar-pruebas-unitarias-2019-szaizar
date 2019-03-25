require "./medias"

def green(text)
    return "\e[32m#{text}\e[0m\n"
end

def red(text)
    return "\e[31m#{text}\e[0m\n"
end

test_result = []

File.open("./CasosPrueba.txt") do |file|
    file.readlines.each do |line|
        start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        # exctracting each value from each line in the file
        id, fn, values, expected = line.chomp.split(':')

        # converting the values to be sent into the function into the correct data type
        values = values.chomp.split(",").map{|v| if v == "nil" then nil else v.to_f end}.compact
        
        expected = if expected == "nil" then nil else expected.to_f end
        
        # calling the corresponding method with an error handling exception
        begin
            obtained = Medias.send("media_#{fn}", values)
        rescue
            error = "El metodo para calcular la media #{fn} no ha sido implementado"
        end
        
        end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        elapsed = end_time - start_time

        prueba = if error or obtained != expected then "fallida" else "exitosa" end

        # Logging data to the console
        test_result.push("Id de prueba:  #{id}\ntipo de media: #{fn}\nprueba: #{prueba} #{if error != nil then "\nERROR: #{error}" else "\nERROR: ninguno" end}\ntiempo: #{elapsed} segundos\n")
    end
end

rp = File.open("Resultados_pruebas_#{Time.now}.txt", "w")
rp << test_result.join("\n")
rp.close

pruebas = 0
fallidas = 0
exitosas = 0

test_result.each do |line| 
    pruebas += 1
    id, tipo, prueba, error, tiempo = line.split("\n").map{|part| part.strip}
    a,b = prueba.split(":").map{|part| part.strip}
    if prueba.include? "fallida"
        prueba = "#{a}: #{red(b)}"
        fallidas += 1
    else
        prueba = "#{a}: #{green(b)}"
        exitosas += 1
    end
    puts id, tipo, prueba, error, tiempo, "\n"
end
puts "Total de pruebas:  #{pruebas}\n   Exitosas: #{green(exitosas.to_s)}   Fallidas: #{red(fallidas.to_s)}"