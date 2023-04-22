#!/bin/bash -i

set -e

source ./library_scripts.sh

echo "Activating feature 'temporalio'"

TMP_FOLDER="$_CONTAINER_USER_HOME/tmp"
TEMPORALITE_VERSION="0.3.0"
NAMESPACE=["$NAMESPACE"="default"]
TEMPORALITE_URL="https://github.com/temporalio/temporalite/releases/download/v${TEMPORALITE_VERSION}/temporalite_${TEMPORALITE_VERSION}_linux_amd64.tar.gz"
TEMPORALITE_FILE="temporalite_linux_amd64.tar.gz"
TEMPORLITE_EXEC="temporalite"

echo "Creating a temp folder for Temporalio: '$TMP_FOLDER'"

mkdir $TMP_FOLDER
cd $TMP_FOLDER

echo "Download Temporalite release from: ${TEMPORALITE_URL}"
clean_download $TEMPORALITE_URL $TEMPORALITE_FILE 

tar -xf $TEMPORALITE_FILE

echo "Move Temporalite to Local bin"
mv $TEMPORLITE_EXEC /usr/local/bin

echo "Clean temp folder for Temporalio"
rm -rf $TMP_FOLDER

chmod +x /usr/local/bin/$TEMPORLITE_EXEC

/usr/local/bin/${TEMPORLITE_EXEC} start --n $NAMESPACE --ephemeral &