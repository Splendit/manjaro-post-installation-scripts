#!/bin/bash

echo "======================================================================"
echo "install printer driver and add office printer"
echo "======================================================================"

# install printer driver
echo "Installing printer driver from dev-share..."
sudo cp /media/dev-share/dev-pc-resources/BHC554ePPDLinux_300000001/English/CUPS1.2/KOC554UX.ppd \
        /usr/share/cups/model/KOC554UX.ppd
sudo systemctl restart org.cups.cupsd

# add printer
echo "Adding printer..."
sudo lpadmin -p KonicaMinoltaOffice -E \
             -v "lpd://printer.splendit.loc/print" \
             -m KOC554UX.ppd \
             -o PaperSources=PC410 \
             -o Model=C284
sudo lpoptions -d KonicaMinoltaOffice
sudo cupsenable KonicaMinoltaOffice
sudo cupsaccept KonicaMinoltaOffice
sudo systemctl restart org.cups.cupsd
