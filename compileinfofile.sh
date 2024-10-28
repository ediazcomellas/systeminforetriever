#!/bin/bash

#Script para recopilacion de información de un equipo
#ediaz@ultreia.es  - 20241028
#
#Licencia GPL v3

HNAME=`hostname`
NOWDATE=`date +%Y%m%d_%H%M%S`
DESTFILE="/tmp/informacion_${HNAME}_${NOWDATE}.txt"


L_SALIDAAARCHIVO=1

exec &>> "${DESTFILE}"

echo "Informacion del servidor ${HNAME} obtenida el ${NOWDATE}"
echo "-----------------------------------------------------------------"
echo

echo -n "Hostname: "
hostname
echo

echo -n "Linux version: "
uname -a
lsb_release
echo

echo -n "Uptime: "
uptime
echo

echo  "Filesystems y opcupación: "
df
echo

echo  "Memoria libre: "
free
echo

if [ !  -z `which lscpu` ]
then
	echo "Información de CPUs:"
	`which lscpu`
	echo
fi

if [ ! -z `which ip` ]
then
	echo "Información de red:" 
	`which ip` address show
	echo
elif [ ! -z `which ifconfig` ]
then
	echo "Información de red:" 
	`which ifconfig` -a
	echo
fi

echo "Procesos activos:"
ps aux
echo

echo "Fin de la información"

