#!/usr/bin/env bash
set -e
source /assets/colorecho

trap "echo_red '******* ERROR: Something went wrong.'; exit 1" SIGTERM
trap "echo_red '******* Caught SIGINT signal. Stopping...'; exit 2" SIGINT

if [ ! -d "/install/database" ]; then
	echo_red "Installation files not found. Unzip installation files into mounted(/install) folder"
	exit 1
fi

echo_yellow "Installing Oracle Database 12c"

su oracle -c "/install/database/runInstaller -silent -debug -force -ignorePreReq -ignoreSysPrereqs -ignoreInternalDriverError -waitforcompletion oracle.install.option=INSTALL_DB_SWONLY UNIX_GROUP_NAME=oinstall INVENTORY_LOCATION=/opt/oracle/oraInventory ORACLE_HOME=/opt/oracle/app/product/12.2.0/dbhome_1 ORACLE_BASE=/opt/oracle/app oracle.install.db.InstallEdition=EE oracle.install.db.OSDBA_GROUP=dba oracle.install.db.OSOPER_GROUP=dba oracle.install.db.OSBACKUPDBA_GROUP=dba oracle.install.db.OSDGDBA_GROUP=dba oracle.install.db.OSKMDBA_GROUP=dba oracle.install.db.OSRACDBA_GROUP=dba oracle.install.db.OSRACDBA_GROUP=dba SECURITY_UPDATES_VIA_MYORACLESUPPORT=false DECLINE_SECURITY_UPDATES=true"
/opt/oracle/oraInventory/orainstRoot.sh
/opt/oracle/app/product/12.2.0/dbhome_1/root.sh
