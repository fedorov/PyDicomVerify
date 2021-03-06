#  mesgtext.awk Copyright (c) 1993-2018, David A. Clunie DBA PixelMed Publishing. All rights reserved.
# create mesgtext ix/description table in correct language 

NR==1	{
	print "# Automatically generated from template - EDITS WILL BE LOST"
	print ""
	print "# Generated by mesgtext.awk with options " language
	print ""

	if (language == "") language="English"

	print "EMSGDC_Table = {"
	n = 0
	}

/^[ 	]*[#]/	{}

/^[ 	]*Index/ {
	n++
	ix=""
	if (match($0,"Index=\"[^\"]*\""))
		ix=substr($0,RSTART+length("Index=\""),
			RLENGTH-length("Index=\"")-1);

	desc=ix
	if (match($0,language"=\"[^\"]*\""))
		desc=substr($0,RSTART+length(language"=\""),
			RLENGTH-length(language"=\"")-1);
	if (n == 1)
		printf "\t\t\"" ix "\":\t\"" desc "\""
	else
		printf ",\n\t\"" ix "\":\t\"" desc "\""

	}
END {
	print "\n}"
	}


