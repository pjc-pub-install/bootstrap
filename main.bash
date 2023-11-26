#! /usr/bin/env bash

clear
echo 

function install_homebrew() {
  echo "===> install homebrew" 

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "===> update .bashrc"
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/pjc/.bashrc

  echo "===> update this shell"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


}

function brew_installs() {
  echo "===> brew_installs()"
  local app_list=(
    mc
    micro
  )

  local app
  for app in ${app_list[@]}; do
    echo 
    echo "===> brew install ${app}"
    brew install ${app}
  done

}

function main() {
  install_homebrew
  brew_installs
}

main


