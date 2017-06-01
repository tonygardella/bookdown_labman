# Apache Configuration (setting up the web interface) 

## Configure Apache - need sudo permissions
```
# become root (so get Betsy or Mike)
sudo -s

# get index page
rm /var/www/html/index.html
ln -s /home/carya/pecan/documentation/index_vm.html /var/www/html/index.html

# fix selinux context (does this need to be done after PEcAn is installed?) ??? - What is this?
chcon -R -t httpd_sys_content_t /home/carya/pecan /home/carya/output

# In /etc/httpd/conf.d

make a new file pecan_USERNAME

Alias /pecan /home/carya/pecan/web
<Directory /home/carya/pecan/web>
  DirectoryIndex index.php
  Options +ExecCGI
  Require all granted
</Directory>


a2enconf pecan ????
/etc/init.d/httpd restart

# done as root
exit

```

## config.php

Copy `pecan/web/config.example.php` to `pecan/web/config.php`and fill in your personal configurations

### Betsy's config.php

This is what Betsy has in her config.php - you can see the sections she changed to inform the way you customize your config.php


**Bety configuration**
```
# Information to connect to the BETY database
$db_bety_type="pgsql";
$db_bety_hostname="psql-pecan.bu.edu";
$db_bety_username="bety";
$db_bety_password="bety";
$db_bety_database="bety";
```
**FIA configuration - not setup but can be filled in**

**Browndog configuration**
```
# browdog information
$browndog_url="http://dap.ncsa.illinois.edu:8184/convert/";
$browndog_username="browndog.user";
$browndog_password="GritGin3";
```
**Host configuration**

Here Betsy changed her commands to qsub, but these changes are NOT necessary, UNLESS you want to do ED runs on geo. If so, refer to instructions on setting up qsub reqests on the geo server. 
This does NOT need to be changed in `config.php`. You can also change these entries in the `pecan.xml` file when setting up a run through the web interface.  

```
# List of all host and options. The list should be the server pointing
# to an array. The second array contains a key value pair used to 
# configure the host. Currenly the following options are available:
# - qsub     : if specified the jobs are launched using qsub, this can
#              be an empty value to indicate to use default settings.
#              If not specified jobs are run on the host itself.
# - jobid    : regex used to parse jobid, only used if qsub specified.
# - qstat    : command used to check if job submitted using qsub is
#              finished.
# - launcher : path to modellauncher, used to for a single job that
#              consists of many smaller jobs
# - job.sh   : any special parameters to add to the job.sh file.
# - folder   : folder on remote machine, will add username and the
#              workflowid to the folder name
# - models   : any special options to add to a specific model that is 
#              launched. This is an array of the modeltype and
#              additional parameters for the job.sh.
$hostlist=array($fqdn => array(),
                "geo.bu.edu" => 
                    array("qsub"   => "qsub -l h_rt=24:00:00 -pe omp 8 -q 'geo*' -V -v OMP_NUM_THREADS=8 -N @NAME@ -o @STDOUT@ -e @STDERR@ -S /bin/bash",
                          "jobid"  => "Your job ([0-9]+) .*",
                          "qstat"  => "qstat -j @JOBID@ || echo DONE",
                          "job.sh" => "module load udunits R/R-3.0.0_gnu-4.4.6",
                          "folder" => "/projectnb/dietzelab/ecowdery/outputs/",
                          "models" => array("ED2"    => "module load hdf5")));
```

**test-pecan specific paths**
```
# Folder where PEcAn is installed
$pecan_install="/home/ecowdery/R/library";

# Location where PEcAn is installed, not really needed anymore
$pecan_home="/home/ecowdery/pecan/";

# Folder where the runs are stored
$output_folder="/fs/data2/output/";

# Folder where the met inputs are stored
$input_folder="/fs/data1/pecan.data/input/";
$dbfiles_folder="/fs/data1/pecan.data/dbfiles/";

# location of BETY DB set to empty to not create links, can be both
# relative or absolute paths or full URL's. Should point to the base
# of BETYDB
$betydb="http:/psql-pecan.bu.edu/bety";
```

Rebuild pecan
```
./pecan/scripts/build.sh
```

## Testing

There are two sites that should be functional:

PEcAn Interface:
Login with your betydb username and password
```
test-pecan.bu.edu/pecan_USERNAME
```

Rstudio:
Login with your pecan servers username and password. 
If this doesn't work, you need to contact Mike and ask him to add you to the dietze lab group on all the pecan servers.
```
test-pecan:8787
```









