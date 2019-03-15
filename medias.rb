module Medias

    # Calcula y regresa la media artimética
    # public static double mediaAritmetica(params int[] vals) { }
    def self.media_aritmetica(arr_nums)
        arr_nums.reduce(:+).to_f/arr_nums.length.to_f
    end
    
    # Calcula y regresa la raíz enésima = x^(1/n)
    # private static double raizEnesima(double x, int n) { }

    
    # Usa raizEnesima para calcular y regresar la media geométrica
    # public double mediaGeometrica(params int[] vals) { }

    
    # Este método no está implementado.
    # public static double mediaArmonica(params int[] vals) { }
end