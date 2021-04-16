# create a variable for today's date so that this can be used later

$today=$((Get-Date).ToString('dd_MM_yyyy'))

# make new directory using today's date

New-Item -ItemType Directory -Path "F:\.\profiles$today"

# robocopy the files across using these switches

robocopy \\server\profiles$ f:\profiles$today /ZB /e /J /R:2 /W:2 /MT:32 /XF *.pst *.tmp *.exe *.ini

# translated: robocopy [source] [destination], switches: z=resume mode over network in case connection drops, b=backup mode which bypasses access restrictions, e=include all directories inc empty, j=unbuffered i/o for large files, r&w=retry and wait, mt=multithread, default value is 8 but can be changed, supports 1 to 128, /xf to exclude large filetypes that are not necessary to be backed up

# only problem with this is it will backup -everything- including file names that are too long for windows file explorer to be able to delete afterwards, this is the best way to delete profiles after the fact

# make an extra folder i.e

# mkdir f:\temp

# then use robocopy to purge using this folder

# robocopy f:\temp f:\profiles$today /purge /MT:32

# after you can delete both folders

# rmdir f:\temp f:\profiles$today