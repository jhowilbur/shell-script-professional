#!/usr/bin/env bash
#
# listaUsuarios.sh - Extrai usuários do /etc/passwd
#
# Site:       https://github.com/jhowilbur/
# Autor:      Wilbur
# Manutenção: Wilbur
#
# ------------------------------------------------------------------------ #
#  Irá extrair usuários do /etc/passwd, havendo a possibilidade de colocar
#  em maiúsculo e em ordem alfabética.
#
#  Exemplos:
#      $ ./listaUsuarios.sh -s -m
#      Neste exemplo ficará em maiúsculo e em ordem alfabética
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 
#     - Adicionado -s, -h & -v
#   v1.1 
#     - Trocamos IF pelo CASE
#     - Adicionamos basename
#   v1.2 
#     - Adicionado -m
#     - Adicionado 2 flags
#   v1.3 
#     - Adicionado while com shift e teste de variável
#     - Adicionado 2 flags
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #
[ ! -x "$(which figlet)" ] && sudo apt install figlet -y
figlet "~ Wilbur ~"
# ------------------------------- VARIÁVEIS ----------------------------------------- #
USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USO="
***	Extrai usuários do /etc/passwd	***

  $(basename $0) - [OPÇÕES]

      -h - Menu de ajuda
      -v - Versão do programa
      -s - Ordernar a saída
      -m - Coloca em maiúsculo

Exemplos:
      $ ./listaUsuarios.sh -s -m
"
VERSAO="v1.3"
CHAVE_ORDENA=0
CHAVE_MAIUSCULO=0
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
while test -n "$1"
do
  case "$1" in
    -h) echo "$MENSAGEM_USO" && exit 0                  ;;
    -v) echo "$VERSAO" && exit 0                        ;;
    -s) CHAVE_ORDENA=1                                  ;;
    -m) CHAVE_MAIUSCULO=1                               ;;
     *) echo "Opção inválida, use help (-h)." && exit 1 ;;
  esac
  shift
done

[ $CHAVE_ORDENA -eq 1 ]    && USUARIOS=$(echo "$USUARIOS" | sort)
[ $CHAVE_MAIUSCULO -eq 1 ] && USUARIOS=$(echo "$USUARIOS" | tr [a-z] [A-Z])

echo "$USUARIOS"
# ------------------------------------------------------------------------ #
