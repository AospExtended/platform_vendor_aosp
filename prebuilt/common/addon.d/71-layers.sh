#!/sbin/sh
#
# /system/addon.d/71-layers.sh
# During a upgrade, this script backs up /system/vendor/overlay files,
# /system is formatted and reinstalled, then the Layers overlay apks are restored.
#
# A script by KreAch3R

. /tmp/backuptool.functions

overlaydir=/system/vendor/overlay

list_files() {

case "$1" in
  backup)
	for i in $(find $overlaydir -type f); do 
		echo ${i##$S/}
	done
  ;;
  restore)
	for i in $(find $C$S -type f); do 
		echo ${i##$C$S/}
	done
  ;;
esac
}

case "$1" in
  backup)
  	echo "STARTING TO BACKUP Layers"
    list_files backup | while read FILE DUMMY; do
      echo backup_file $S/"$FILE"
      backup_file $S/"$FILE"
    done
    ls -al /tmp/backupdir$overlaydir
    echo "BACKUP Layers END"
  ;;
  restore)
    list_files restore | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      echo "R="$R
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
      echo $S/$FILE":" $( ls -alZ $S/$FILE )
    done
    echo "RESTORE Layers END"
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
