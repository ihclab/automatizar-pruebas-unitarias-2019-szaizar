require "./medias"

File.open("./CasosPrueba.txt") do |file|
    file.readlines.each do |line|
        # exctracting each value from each line in the file
        id, fn, values, expected = line.chomp.split(':')

        # converting the values to be sent into the function into the correct data type
        values = values.chomp.split(",").map{|v| if v == "nil" then nil else v.to_f end}.compact
        
        expected = if expected == "nil" then nil else expected.to_f end
        
        # calling the corresponding method with an error handling exception
        begin
            obtained = Medias.send("media_#{fn}", values)
        rescue
            puts "\nEl metodo para calcular la media #{fn} no ha sido implementado"
            puts "\n"
        end

        # Logging data to the console
        puts "Id de prueba:  #{id} tipo de media: #{fn} prueba: #{if obtained == expected then "exitosa" else "fallida" end}"
    end
end