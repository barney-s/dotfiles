#!/usr/bin/env bash
set -x
=======
#!/usr/bin/env bash 
#set -x

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
  myrepo=git@github.com:barney-s/$2.git
  if [ -d $3/$2 ]; then
    echo "$3/$2 already exists. Not cloning ${myrepo}"
  else
    mkdir -p $3
    cd $3
    git clone ${myrepo}
  fi
  cd $3/$2
  git remote add upstream $1/$2.git && echo "Set upstream $1/$2.git" || echo "upstream already exists"
}

setup_k8s_dev_env ()
{
  clone_github_repo git@github.com:kubernetes kubernetes $GOPATH/src/k8s.io 
  clone_github_repo git@github.com:kubernetes enhancements $GOPATH/src/k8s.io
  clone_github_repo git@github.com:kubernetes-sigs application $GOPATH/src/github.com/kubernetes-sigs
  clone_github_repo git@github.com:kubernetes-sigs kubebuilder $GOPATH/src/github.com/kubernetes-sigs
}

setup_golang
setup_k8s_dev_env
