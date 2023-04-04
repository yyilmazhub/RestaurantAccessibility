#!/bin/bash

print_usage(){
  echo "Usage: $0 <preprod | prod> [--help]"
}

print_help_and_exit(){
  echo "deploy - Outil pour mettre en production votre projet sur le serveur de preprod ou sur le serveur de prod."
  echo
  print_usage
  echo "Environnement : "
  echo "  preprod :              déploie votre projet sur le serveur de preprod de l'IUT."
  echo "  prod :                 déploie votre projet sur le serveur de prod de l'IUT."
  echo
  echo "Paramètres optionnels :"
  echo "  - -h, --help : affiche cette aide."
  exit 0
}

if [ $# -eq 0 ]; then
  echo "Mauvais paramètres" >&2
  print_usage
  exit 1
fi

case $1 in
  preprod|prod) typeEnv=$1;;
  -h|--help) print_help_and_exit;;
  *)
    echo "Paramètre incorrect \"$1\"" >&2;
    print_usage
    exit 1;;
esac
shift

if [ "$1" == "-h" -o "$1" == "--help" ]; then
  print_help_and_exit
fi

if [ ${typeEnv} == "preprod" ]; then
    serverDir="preprod"
    gitBranch="release"
    message="Testez l'url http://site.preprod.g3-lpdiwa.edu/. Il faut attendre plusieurs minutes. Si cela ne fonctionne toujours pas analysez les logs des conteneurs."

else
  if [ ${typeEnv} == "prod" ]; then
    serverDir="prod"
    gitBranch="master"
    message="Testez l'url http://la-diwa-03.univ-lemans.fr/. Il faut attendre plusieurs minutes. Si cela ne fonctionne toujours pas analysez les logs des conteneurs."
  fi
fi

set -x

echo "************"
echo "Étape 1: Récupération du code source sur Github"
echo "************"
cd /home/lpdiwa/${serverDir}/
if [ -d ./2122-LPDIWA-PROJET-G3 ]; then
  cd ./2122-LPDIWA-PROJET-G3/script
  ./dcTool prod -lmp down -v
  cd ../..
  sudo rm -rf ./2122-LPDIWA-PROJET-G3/
fi

#git clone -b ${gitBranch} https://github.com/IUT-LAVAL-MMI/2021-LPDIWA-PROJET-G3.git
git clone -b demo git@github.com:/IUT-LAVAL-MMI/2122-LPDIWA-PROJET-G3.git
cd ./2122-LPDIWA-PROJET-G3
sudo rm -rf ./.git

echo "************"
echo "Étape 2: Lancement des conteneurs en mode prod et détaché"
echo "************"
cd ./script
./dcTool prod -lmp up -d

echo "************"
echo "Étape 3: Mise en production"
echo "************"

echo ${message}

exit $?

