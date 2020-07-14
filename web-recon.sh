#!/bin/bash

SITE="$1"
EXTENSION="$2"

if [ $SITE == "" ]
then
	echo ".:              W3B.REC0N - Raz0rG1rl               :."
	echo ".: Modo de uso: ./web-recon target.com.br extension :."
else
	WEBSERVER=$(curl -s --head $SITE | grep "Server" | cut -d ":" -f2)
	echo "=============================================="
	echo "WEBSERVER IDENTIFICADO: $WEBSERVER"
	echo "=============================================="
	echo "Buscando diretórios e arquivos..."
	for word  in $(cat wordlist.txt)
	do
		RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -H "User Agent: r4Z0RTool"  $SITE/$word)
		if [ $RESPONSE == "200" ]
		then
			echo "Diretório descoberto! $SITE/$word"
		fi
	done
	echo "Busca finalizada!"
fi

