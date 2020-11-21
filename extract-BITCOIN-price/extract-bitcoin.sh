#!/usr/bin/env bash
#
# Site:       https://github.com/jhowilbur
# Autor:      WIlbur
#
# ------------------------------------------------------------------------ #
#  Irá extrair os valores atuais do bitcoin
#
#  Exemplos:
#      $ ./price-bitcoin.sh 
# ------------------------------------------------------------------------ #

# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #
[ ! -x "$(which figlet)" ] && sudo apt install figlet -y
figlet "~ Wilbur ~"
# ------------------------------- VARIÁVEIS ----------------------------------------- #
MESSAGE=(
	"Maior valor no dia: "
	"Menor valor no dia: "
	"Quantidade negociada: "
	"Valor de compra: "
	"Valor de venda: "
)
HIT_API=${1:-1}
URL_API=https://www.mercadobitcoin.com.br/api/BTC/ticker
# ACESSAR_API=curl $URL_API
MESSAGE_VALUES=()
# SOMA_VALOR_COMPRA=(array com valores atualizados valor compra)
# MEDIA_valor_compra=(somar valor +1)/2

# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -x "$(which curl)" ] && sudo apt install curl -y # Curl instalado?
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

# ------------------------------------------------------------------------ #
