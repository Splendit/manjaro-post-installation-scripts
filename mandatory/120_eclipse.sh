#!/bin/bash

echo "======================================================================"
echo "install eclipse versions for development and testing"
echo "======================================================================"

CONF_FILE=../install.conf

main() {
  ECLIPSE_INSTALL_DIR=`expandPath $(grep ECLIPSE_INSTALL_DIR $CONF_FILE | cut -d'=' -f2)`
  ECLIPSE_MIRROR=$(grep ECLIPSE_MIRROR $CONF_FILE | cut -d'=' -f2)
  ECLIPSE_VERSIONS=($(grep ECLIPSE_VERSIONS $CONF_FILE | cut -d'=' -f2))
  
  # download eclipse
  # mirror and install dir as param
  mkdir -p $ECLIPSE_INSTALL_DIR

  for version in ${ECLIPSE_VERSIONS[@]}
  do
    echo "----------------------------------------------------------------------"
    echo "install eclipse $version"
    echo "----------------------------------------------------------------------"

    echo "Download..."
    wget -O "/tmp/eclipse-rcp-$version.tar.gz" "$ECLIPSE_MIRROR/technology/epp/downloads/release/$version/R/eclipse-rcp-$version-R-linux-gtk-x86_64.tar.gz"

    echo "Extract..."
    tar -C $ECLIPSE_INSTALL_DIR -xzf "/tmp/eclipse-rcp-$version.tar.gz"
    mv $ECLIPSE_INSTALL_DIR/eclipse "$ECLIPSE_INSTALL_DIR/rcp-$version"

    echo "Cleanup..."
    rm "/tmp/eclipse-rcp-$version.tar.gz"

    echo "Done."
  done

  # 2018-09 has to be downloaded separately because the file name doesn't adhere to the conventions

  echo "----------------------------------------------------------------------"
  echo "install eclipse 2018-09"
  echo "----------------------------------------------------------------------"
  wget -O /tmp/eclipse-java-2018-09.tar.gz $ECLIPSE_MIRROR/technology/epp/downloads/release/2018-09/R/eclipse-java-2018-09-linux-gtk-x86_64.tar.gz
  tar -C $ECLIPSE_INSTALL_DIR -xzf /tmp/eclipse-java-2018-09.tar.gz
  mv $ECLIPSE_INSTALL_DIR/eclipse $ECLIPSE_INSTALL_DIR/java-2018-09
  rm /tmp/eclipse-java-2018-09.tar.gz
}

# this is a solution from stackoverflow to expand the path
# the tilde (~) made a problem ("ls: cannot access '~/backups-docker-prod': No such file or directory")
# stackoverflow source: https://stackoverflow.com/a/29310477
expandPath() {
  local path
  local -a pathElements resultPathElements
  IFS=':' read -r -a pathElements <<<"$1"
  : "${pathElements[@]}"
  for path in "${pathElements[@]}"; do
    : "$path"
    case $path in
      "~+"/*)
        path=$PWD/${path#"~+/"}
        ;;
      "~-"/*)
        path=$OLDPWD/${path#"~-/"}
        ;;
      "~"/*)
        path=$HOME/${path#"~/"}
        ;;
      "~"*)
        username=${path%%/*}
        username=${username#"~"}
        IFS=: read _ _ _ _ _ homedir _ < <(getent passwd "$username")
        if [[ $path = */* ]]; then
          path=${homedir}/${path#*/}
        else
          path=$homedir
        fi
        ;;
    esac
    resultPathElements+=( "$path" )
  done
  local result
  printf -v result '%s:' "${resultPathElements[@]}"
  printf '%s\n' "${result%:}"
}

main
