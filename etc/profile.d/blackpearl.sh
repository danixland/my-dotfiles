#! /bin/bash
# Print info and a logo for interactive shells:

function OUTPUT () {
	# Define our variables
	HOST=$(echo $HOSTNAME |cut -d"." -f1)
	K_v=$(uname -r)
	K_ar=$(uname -m)
	OS=$(cat /etc/slackware-version)
	LOAD=$(uptime |cut -d " " -f12-)
	PKGS=$(/bin/ls -1 /var/log/packages/ |wc -l)
	DE=$(env |grep DESKTOP_SESSION |cut -d "/" -f5)

	# Define or colors
	CYAN="\e[1;36m"
	ORANGE="\e[1;33m"
	MAGENTA="\e[1;35m"
	BLUE="\e[1;34m"
	RED="\e[1;31m"
	GREEN="\e[1;32m"
	WHITE="\e[1;37m"
	CLEAR="\e[0;0m"

	USER_COLOR=$GREEN
	if [ ${UID} -eq 0 ]
		then
        	USER_COLOR=$RED
	fi


	echo -e "$ORANGE"
	echo -e "                    .                            ${CYAN}/> /${ORANGE}"
	echo -e "                   oW                           ${CYAN}/ </${ORANGE}"
	echo -e "         .'        dN                          ${CYAN}/> /${ORANGE}"
	echo -e "          c0;    ....       .;cdo.            ${CYAN}/ </\t${USER_COLOR}$USER ${CLEAR}@ ${BLUE}$HOST${ORANGE}"
	echo -e "            . x0kocclodddc..;,.              ${CYAN}/> /${ORANGE}"
	echo -e "             ,M,         .;dx.              ${CYAN}/ </ ${MAGENTA}OS:\t\t${WHITE}${OS}${ORANGE}"
	echo -e "             cM.;:0dll'     ,W;            ${CYAN}/> /\t ${MAGENTA}KERNEL:\t${WHITE}$K_v - $K_ar${ORANGE}"
	echo -e "             xW x . .'ldc.  'Wd           ${CYAN}/ </\t ${MAGENTA}LOAD AVG:\t${WHITE}${LOAD}${ORANGE}"
	echo -e "             KK k  .::;.  ;OK:.odol:'    ${CYAN}/> /\t ${MAGENTA}PACKAGES:\t${WHITE}${PKGS}${ORANGE}"
	echo -e "            .Ml.d.:;  .;kXo.       ..   ${CYAN}/ </\t ${MAGENTA}SHELL:\t\t${WHITE}${SHELL}${ORANGE}"
	echo -e "            'x...xldkOkl.              ${CYAN}/> /\t ${MAGENTA}DE:\t\t${WHITE}${DE}${ORANGE}"
	echo -e "           .0xdxxd'                   ${CYAN}/ </${ORANGE}"
	echo -e "            KWXxo                    ${CYAN}/> / ${ORANGE}"
	echo -e "            ..                      ${CYAN}/ </  ${ORANGE}"
	# reset colours
	echo -en "$CLEAR"
	echo
}

RUN IT!!
case $- in
*i* )  # We're interactive
  clear
  OUTPUT
  ;;
esac
