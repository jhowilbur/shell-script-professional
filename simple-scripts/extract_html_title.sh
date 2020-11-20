#!/usr/bin/env bash
#
# extract_html_title.sh - Extrai titulos do blog
#
# Site:       https://github.com/jhowilbur
# Autor:      Wilbur
# Manutenção: Wilbur
#
# ------------------------------------------------------------------------ #
#  Este programa irá extrair títulos do blog LXER, colocar em um arquivo de
#  texto e ler mostrando com cores na tela.
#
#  Exemplos:
#      $ ./extract_html_title.sh
#      Neste exemplo o programa vai extrair os titulos e mostrar na tela.
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 03/10/2018, Wilbur:
#       - Montamos a expressões regular com fator em comum
#   v1.1 10/10/2018, Wilbur:
#       - Criado primeiro código com cores
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_DE_TITULOS="titles.txt"
FOLDER="files-created/"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"

VERSAO="v1.3"
MENSAGEM_USO="
***	Extract itens from div	***

  $(basename $0) - [OPÇÕES]

      -h - Menu de ajuda
      -v - Versão do programa

Exemplos:
      $ ./extract_html_title.sh -v
"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -x "$(which curl)" ] && sudo apt install curl -y # Curl instalado?
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
curl -i http://lxer.com/ | grep blurb | sed 's/<div.*line">//;s/<\/span.*//' > "$FOLDER$ARQUIVO_DE_TITULOS"

while read -r titulo_lxer
do
  echo -e "${VERMELHO}Titulo: ${VERDE}$titulo_lxer"
done < "$FOLDER$ARQUIVO_DE_TITULOS"
# ------------------------------------------------------------------------ #
