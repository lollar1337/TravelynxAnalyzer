#!/bin/bash

RECOUNT=0
ICECOUNT=0
RBCOUNT=2
HLBCOUNT=0
SCOUNT=4
MECOUNT=0
VIACOUNT=0
ECCOUNT=0
BUSCOUNT=0
FLXCOUNT=0
WFBCOUNT=0
RTCOUNT=0
FEXCOUNT=0
FRANKFURTCOUNT=0
HOMECOUNT=0

RAW_DATA=$(cat history.json)

rm notSorted

for (( i=0; i<1000000; i++ ))
do
	TYPE=$(jq -r '.['$i'].type' <<< "${RAW_DATA}")
	TO_NAME=$(jq -r '.['$i'].to_name' <<< "${RAW_DATA}")
	
	if [[ "$TO_NAME" == "Frankfurt(Main)Hbf" ]];then
		FRANKFURTCOUNT=$(( "$FRANKFURTCOUNT"+1 ))
		echo $FRANKFURTCOUNT
	fi


	if [[ "$TO_NAME" == "" ]];then
		HOMECOUNT=$(( "$HOMECOUNT"+1 ))
		echo $HOMECOUNT
	elif [[ "$TO_NAME" == "" ]];then
		HOMECOUNT=$(( "$HOMECOUNT"+1 ))
		echo $HOMECOUNT
	elif [[ "$TO_NAME" == "" ]];then
		HOMECOUNT=$(( "$HOMECOUNT"+1 ))
		echo $HOMECOUNT
	fi

	if [[ "$TYPE" == "RE" ]];then

		RECOUNT=$(( "$RECOUNT"+1 ))
		echo $RECOUNT

	elif [[ "$TYPE" == "ICE" ]];then

		ICECOUNT=$(( "$ICECOUNT"+1 ))
		echo $ICECOUNT

	elif [[ "$TYPE" == "RB" ]];then

		RBCOUNT=$(( "$RBCOUNT"+1 ))
		echo $RBCOUNT

	elif [[ "$TYPE" == "S" ]];then

		SCOUNT=$(( "$SCOUNT"+1 ))
		echo $SCOUNT

	elif [[ "$TYPE" == "HLB" ]];then

		HLBCOUNT=$(( "$HLBCOUNT"+1 ))
		echo $HLBCOUNT

	elif [[ "$TYPE" == "ME" ]];then

		MECOUNT=$(( "$MECOUNT"+1 ))
		echo $MECOUNT
	
	elif [[ "$TYPE" == "VIA" ]];then

		VIACOUNT=$(( "$VIACOUNT"+1 ))
		echo $VIACOUNT
	
	elif [[ "$TYPE" == "EC" ]];then

		ECCOUNT=$(( "$ECCOUNT"+1 ))
		echo $ECCOUNT
	
	elif [[ "$TYPE" == "Bus" ]];then

		BUSCOUNT=$(( "$BUSCOUNT"+1 ))
		echo $BUSCOUNT
	
	elif [[ "$TYPE" == "FLX" ]];then

		FLXCOUNT=$(( "$FLXCOUNT"+1 ))
		echo $FLXCOUNT
	
	elif [[ "$TYPE" == "WFB" ]];then

		WFBCOUNT=$(( "$WFBCOUNT"+1 ))
		echo $WFBCOUNT
	
	elif [[ "$TYPE" == "RT" ]];then

		RTCOUNT=$(( "$RTCOUNT"+1 ))
		echo $RTCOUNT

	elif [[ "$TYPE" == "FEX" ]];then

		FEXCOUNT=$(( "$FEXCOUNT"+1 ))
		echo $FEXCOUNT
	elif [[ "$TYPE" == "null" ]]; then
		break;
	else
		echo $TYPE >> notSorted
	fi


done

echo "Frankfurt gefahren:	"	$FRANKFURTCOUNT
echo "Heim gefahren:		"	$HOMECOUNT
echo "RE Fahrten: 		" 	$RECOUNT
echo "RB Fahrten: 		" 	$RBCOUNT
echo "ICE Fahrten: 		" 	$ICECOUNT
echo "S-Bahn Fahrten: 	" 	$SCOUNT
echo "HEB Fahrten: 		" 	$HLBCOUNT
echo "ME Fahrten: 		" 	$MECOUNT
echo "VIA Fahrten: 		" 	$VIACOUNT
echo "EC Fahrten: 		" 	$ECCOUNT
echo "SEV Fahrten: 		" 	$BUSCOUNT
echo "FLX Fahrten: 		" 	$FLXCOUNT
echo "WFB Fahrten: 		" 	$WFBCOUNT
echo "RT Fahrten: 		" 	$RTCOUNT
echo "FEX Fahrten: 		" 	$FEXCOUNT
