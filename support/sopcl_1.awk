#  sopcl.awk Copyright (c) 1993-2018, David A. Clunie DBA PixelMed Publishing. All rights reserved.
# create C++ headers from SOP class template 

NR==1	{
	print "# Automatically generated from template - EDITS WILL BE LOST"
	print ""
	print "# Generated by sopcl.awk  " 
	print ""

	

	}

/^[ 	]*[#]/	{}

/^[ 	]*Name=/ || /^[ 	]*DirectoryRecord=/ {

	name=""
	if (match($0,"Name=\"[^\"]*\""))
		name=substr($0,RSTART+length("Name=\""),
			RLENGTH-length("Name=\"")-1);

	desc=name
	if (match($0,"Desc=\"[^\"]*\""))
		desc=substr($0,RSTART+length("Desc=\""),
			RLENGTH-length("Desc=\"")-1);

	type="Class"
	if (match($0,"Type=\"[^\"]*\""))
		type=substr($0,RSTART+length("Type=\""),
			RLENGTH-length("Type=\"")-1);

	uid=""
	if (match($0,"Uid=\"[^\"]*\""))
		uid=substr($0,RSTART+length("Uid=\""),
			RLENGTH-length("Uid=\"")-1);
	print  name "SOPClassUID = \"" uid "\""
#		print "#define\t" name "SOP" type "UID\t\"" uid "\""
#		print "extern const char *" name "SOP" type "UID;"
#		print "const char *" name "SOP" type "UID = \"" uid "\";"
#		print "\t\"" name "\",\"" desc "\",\"" uid "\",\"" dirrec "\","


	}

END {

}

