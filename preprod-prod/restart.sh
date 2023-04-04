#!/bin/bash

print_usage(){
  echo "Usage: $0 <preprod | prod> [--help]"
}

print_help_and_exit(){
  echo "restart - Outil pour redémarrer la mise en ligne de votre projet sur le serveur de preprod ou sur le serveur de prod."
  echo
  print_usage
  echo "Environnement : "
  echo "  preprod :              redémarre votre projet sur le serveur de preprod de l'IUT."
  echo "  prod :                 redémarre votre projet sur le serveur de prod de l'IUT."
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
    message="Testez l'url http://site.preprod.g3-lpdiwa.edu/. Il faut attendre plusieurs minutes. Si cela ne fonctionne toujours pas analysez les logs des conteneurs."

else
  if [ ${typeEnv} == "prod" ]; then
    serverDir="prod"
    message="Testez l'url http://la-diwa-03.univ-lemans.fr/. Il faut attendre plusieurs minutes. Si cela ne fonctionne toujours pas analysez les logs des conteneurs."
  fi
fi

set -x


echo "************"
echo "Étape 1: Lancement des conteneurs en mode prod et détaché"
echo "************"

cd /home/lpdiwa/${serverDir}/
if [ -d ./2122-LPDIWA-PROJET-G3 ]; then
  cd ./2122-LPDIWA-PROJET-G3/script
  ./dcTool prod -lmp up -d
  echo "************"
  echo "Étape 2: Mise en production"
  echo "************"

  echo ${message}
else
  echo "Dossier inexistant, votre projet n'a jamais été déployé."
fi

exit $?