#!/bin/bash


. Conf/Test.cnf

function Cadastro(){
	
	echo -e "Difite seu nome"
	echo -en "\e[31;1m-->\em "; read Nome
	echo -e "Difite seu Endereco"
	echo -en "\e[31;1m-->\em "; read End
	echo -e "Difite seu Telefone"
	echo -en "\e[31;1m-->\em "; read Tel
	SalvaDb Nome
	}

function SalvaDb(){
	
	
	case $1 in
		"Nome")
				echo -e ""${Nome}":"${End}":"${Tel}"" >> $DbNome
			;;
		esac
	}

function Search(){
	Nome=$2
	egrep -i "$Nome" $DbName
	}

function Help(){
	
	echo -e "
	User as seguintes opções
	$0 cadastro
	$0 search (NOME|Endereco|telefone)
	$0 lista
	"
	}

case $1 in
	cadastro)
				Cadastro
			;;
		lista)
				Lista
			;;
		search)
				Search $2
			;;
			*)
				Help
			;;
esac
	
