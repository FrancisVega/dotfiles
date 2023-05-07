#!/bin/zsh

# Listar los alias del sistema y almacenarlos en una variable
alias_list=$(alias)

# Iterar sobre cada alias en la lista
for line in ${(s: :)alias_list}; do
    # Extraer el nombre del alias y la definición
    alias_name=${(w: :)line}[1]
    alias_definition=${(w: :)line}[2,-1]

    # Buscar si hay un comentario en la definición del alias
    if [[ "$alias_definition" == *'#'* ]]; then
        # Extraer la cadena a partir del carácter "#" hasta el final
        comment=${alias_definition##*#}
        # Imprimir el alias en verde y la cadena en gris
        echo -e "\033[0;32m$alias_name\033[0m : \033[2;37m$comment\033[0m"
    else
        # Si no hay comentario, imprimir solo el alias en verde
        echo -e "\033[0;32m$alias_name\033[0m"
    fi
done
