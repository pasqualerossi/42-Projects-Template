generateStructure()
{
	prevtab=0
	prevfolder=""
	IFS=''
	while read line || [ -n "$line" ]
	do
		currtab=$(echo $line | grep -Eo "(\t|    )" | wc -l | grep -Eo "\d+")
		currfolder=$(echo $line | grep -Eo "[^	 ]+")

		if [ $currtab -gt $prevtab ]
		then
			cd $prevfolder
		elif [ $prevtab -gt $currtab ]
		then
			while [ $prevtab -gt $currtab ]
			do
				cd ..
				let "prevtab=$prevtab-1"
			done
		fi

		mkdir $currfolder

		prevtab=$currtab
		prevfolder=$currfolder
	done < "$1"
}

generateStructure structure.fs