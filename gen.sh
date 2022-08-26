generateStructure()
{
	prevtab=0
	prevfolder=""
	IFS=''
	while _s= read -r line
	do
		currtab=$(echo $line | grep -o "^\t" | wc -l)
		echo $currtab
		currfolder=$line



		prevtab=$currtab
		prevfolder=$currfolder
	done < "$1"
}

generateStructure test.fs