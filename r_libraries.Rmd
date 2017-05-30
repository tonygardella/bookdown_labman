# Setup your personal R library


## Is this your first time setting up your R library? 

Make sure to replace `USERNAME`
```
# Create the directory for your personal R library 
# (the home of your pecan package) 
# and save the path to your .bashrc file

echo 'export R_LIBS_USER=${HOME}/R/library' >> ~/.bashrc
source ~/.bashrc
mkdir -p ${R_LIBS_USER}

# Create symbolic link from your home directory to the actual location of the R library

mkdir /fs/data3/USERNAME/R/library
ln -s /fs/data3/USERNAME/R/library/  ~/R/
```

## Have you already set up your R library?

If you've already been using test-pecan, you may have already defined `$R_LIBS_USER` and maybe even have started installing packages in `~/R/library`, if this is the case, you just need to move the files over to the new R/library directory and make a symbolic link. 

Why did we change this? Because there isn't enough room in the home directory. 

```
mkdir /fs/data3/USERNAME/R/library
mv  -v ~/R/library/* /fs/data3/USERNAME/R/library/

# Create symbolic link from your home directory to the actual location of the R library

ln -s ~/R/library/ /fs/data3/USERNAME/R/library/
```
If you have already installed PEcAn, rebuild.

## Troubleshooting
```
# Make sure Betsy setup Rstudio to the right R library
echo 'r-libs-user=~/R/library >>  /etc/rstudio/rsession.conf 
```
