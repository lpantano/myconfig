#!/bin/bash

set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   ## set -u : exit the script if you try to use an uninitialised variable
set -o errexit   ## set -e : exit the script if any statement returns a non-true return value
set -v
set -x
export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

DIRECTORY = myconfig

cd

if [ ! -d "$DIRECTORY" ]; then
 echo 'myconfig need to be at home directory'
 echo 'get it doing:'
 echo 'git clone https://github.com/lpantano/myconfig.git'
 exit
fi	

mkdir -p .config

ln -Lsb $DIRECTORY/bash/bashrc  .config/mybashrc

echo 'source ~/.config/mybashrc' >> .bashrc

git clone https://github.com/nojhan/liquidprompt.git

ln -s $DIRECTORY/liquidprompt/my.theme ~/.config/.
ln -s $DIRECTORY/liquidprompt/my.ps1 ~/.config/.
ln -s $DIRECTORY/liquidprompt/liquidpromptrc ~/.config/liquidpromptrc

ln -Lbs $DIRECTORY/.vimrc .vimrc

ln -Lbs $DIRECTORY/vim .vim

ln -Lbs $DIRECTORY/tmux.conf .tmux.conf
mkdir .tmux

echo 'installation complete, enjoy!'
