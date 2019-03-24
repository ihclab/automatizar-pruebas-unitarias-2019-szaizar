module Medias

    # Calcula y regresa la media artimética
    # public static double mediaAritmetica(params int[] vals) { }
    def self.media_aritmetica(arr_nums)
        if arr_nums == nil
            return nil
        else
            arr_nums = arr_nums.compact
        end
        if arr_nums.empty?
            return nil
        end
        (arr_nums.reduce(:+).to_f/arr_nums.length.to_f).truncate(4)
    end
    
    # Calcula y regresa la raíz enésima = x^(1/n)
    # private static double raizEnesima(double x, int n) { }
    def self.raiz_enesima(x,n)
        x.to_f**(1/n.to_f)
    end
    
    # Usa raizEnesima para calcular y regresar la media geométrica
    # public double mediaGeometrica(params int[] vals) { }
    def self.media_geometrica(arr_nums)
        if arr_nums == nil
            return nil
        else
            arr_nums = arr_nums.compact
        end
        if arr_nums.empty?
            return nil
        end
        (raiz_enesima(arr_nums.reduce(:*).to_f,arr_nums.length.to_f)).truncate(4)
    end
    
    # Este método no está implementado.
    # public static double mediaArmonica(params int[] vals) { }
    def self.media_armonica(arr_nums)
        raise "not implemented"
    end
end