# Installing PEcAn

## Setup ssh key for github

We recommend following the github documentation

https://help.github.com/articles/generating-ssh-keys/ 

NOTE: For step 4 (adding your SSH key to your account)
the pecan servers don't have `pbcopy` so `cat .ssh/id_rsa.pub` and manually copy paste. 

## Clone Your FORK of PEcAn

Install the build of pecan in local repo (where you will do the development)

**Make sure you use the SSH url**

You can copy the link from the github webpage for the repository. 

<img src="git_link.png" alt="PecanLogo" align="middle" style="width: 400px;"/> 

For example, to clone Betsy's version of PEcAn:
```
cd
git clone git@github.com:PecanProject/bcow.git
```

## First build of PEcAn

```
cd pecan
./scripts/build.sh --dependencies 
```

Every time you make changes to the PEcAn code you will need to rebuild. However, you won't need to rebuild dependencies. 

### Troubleshooting

- If the build is broken, make sure that you have the latest version of the pecan code `git pull upstream master` and rebuild 
- Do you have the right build of python? We may need to [reinstall](http://toomuchdata.com/2014/02/16/how-to-install-python-on-centos/)...


