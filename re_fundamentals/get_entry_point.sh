#!/bin/bash

. ./messages.sh

ELF=$(readelf -h $1 2>/dev/null)
if [[ $? -ne 0 ]]; then
	echo 'Something has gone wrong'
	exit 1	
fi
file_name=$1
magic_number=$(echo $ELF | grep -oP 'Magic: \K.*(?= Class)')
class=$(echo $ELF | grep -oP 'Class: \K.*(?= Data)')
byte_order=$(echo $ELF | grep -oP ', \K.* endian(?= )')
entry_point_address=$(echo $ELF | grep -oP 'Entry point address: \K.*(?= Start of program headers)')
display_elf_header_info
