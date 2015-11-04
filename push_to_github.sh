#!/usr/bin/env /bin/bash
#
# Executar push para repositório github remoto
#
# @author Wanderlei Silva do Carmo <Wander.silva@gmail.com>
# @version 1.0
######################################################################################

REMOTO="https://github.com/w3aewander/Restaurante"
 
if [[ -n $1 ]]; then
    git add --all && git commit -m "$1" && git push $REMOTO && echo "Sucesso..." 2> /dev/null
else
  echo "Você deve fornecer uma descricao do commit"
  echo "Push não executado"
fi

#Fim 
