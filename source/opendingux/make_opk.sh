#!/bin/bash
set -e
umask 0022

# Write metadata.
cat > default.gcw0.desktop <<EOF
[Desktop Entry]
Name=ReGBA
Comment=Game Boy Advance Emulator
Comment[fr]=Émulateur Game Boy Advance
Comment[es]=Emulador Game Boy Advance
X-OD-Manual=manual-en.txt
X-OD-Manual[es]=manual-es.txt
X-OD-Manual[fr]=manual-fr.txt
Icon=/data/regba-silver
Exec=regba %f
Terminal=false
Type=Application
StartupNotify=true
Categories=emulators;
MimeType=application/x-gba-rom;application/zip;
EOF

# Create OPK.
OPK_FILE=ReGBA.opk
mksquashfs \
	regba \
	data/* \
	../../bios/gba_bios.bin \
	../../game_config.txt \
	$OPK_FILE \
	-no-progress -noappend -comp gzip -all-root

echo
echo "=========================="
echo
echo "Updater OPK:       $OPK_FILE"
echo
