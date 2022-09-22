
function preety_print(array)

    for el in array


        println(
            first(string(el),30)* "........"*last(string(el),30)
        );

    end

end
