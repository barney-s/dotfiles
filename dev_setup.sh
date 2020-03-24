#!/usr/bin/env bash
set -x

set -o errexit
set -o pipefail
set -o nounset


setup_golang ()
{
   which go || error "Please install golang. https://golang.org/doc/install"
   grep GOPATH ~/.bash_profile || echo 'export GOPATH=${HOME}/workspace' >> ~/.bash_profile
}

clone_github_repo ()
{
  mkdir -p $1
  cd $1
  if [ -d $1/$2 ]; then
    echo "$1/$2 already exists. Not cloning $3"
  else
    git clone $3
  fi
  if [ "$4" != "" ]; then
     cd $1/$2
     git remote add upstream $4 && echo "Set upstream $4" || echo "upstream already exists"
  fi
}

setup_k8s_dev_env ()
{
  clone_github_repo $GOPATH/src/k8s.io kubernetes git@github.com:barney-s/kubernetes.git git@github.com:kubernetes/kubernetes.git
  clone_github_repo $GOPATH/src/k8s.io enhancements git@github.com:barney-s/enhancements.git git@github.com:kubernetes/enhancements.git
}

setup_golang
setup_k8s_dev_env
