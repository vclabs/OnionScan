
# onionscan deployment

note! this repo is a patched version of https://github.com/s-rah/onionscan and is designed to be run from a google cloud shell from hunchly at https://github.com/hunchly/funchly/tree/main/onionscan which has been used as the baseline and modified to also be able to deploy on a local instance.


## onionscan on google cloud shell

#### 1. to get a free cloud shell account: https://console.cloud.google.com/getting-started?pli=1

#### 2. open your cloud shell you click here:

![gcp launch cloud shell](https://gitlab.com/n3ph0s/onionscan/-/raw/media/gcp.png)

#### 3. from your cloud shell:

`https://gitlab.com/n3ph0s/onionscan/-/raw/main/cloudshell_install_onionscan.sh`

`chmod +x cloudshell_install_onionscan.sh`

`./cloudshell_install_onionscan.sh`

#### 4. you now need a way to connect into tor, and we can use docker (already setup in google cloud shell) for this:

`docker run -it -p 127.0.0.1:9050:9050 --name torproxy -d dperson/torproxy`

`docker inspect torproxy`

you will need to re-run the tor proxy / docker commands above each time you drop into a cloud shell.

#### 5. note the ip address listed in the ipaddress field and then run onionscan:

`onionscan -torproxyaddress <ip address of docker container>:9050 -verbose <onion address>`

#### 6. use the web preview in google cloud shell to view the onion scan correlation lab:

![gcp launch web preview](https://gitlab.com/n3ph0s/onionscan/-/raw/media/gcp_webshell.png)
your browser should open the onion scan correlation lab in a new tab:

![onionscan correlation lab!](https://gitlab.com/n3ph0s/onionscan/-/raw/media/correlation.png)


#### 7. some common searches:
`snapshot` - finds all types of all data extracted.

`crawl` - finds all successful crawls.

`ssh` - find all ssh banners retrieved.

`email-address` - search for extracted email addresses.

`mod_status` - this will find hidden services potentially leaking the "real" ip address.

or you can search for the title of a hidden service from the hunchly dark web report.


## onionscan on local instance

note! this is based on a clean installation of ubuntu 20.04 and the instructions can be modified for other versions of linux using the below instructions as a base


#### 1. from the terminal on your local machines:

`wget https://gitlab.com/n3ph0s/onionscan/-/raw/main/local_install_onionscan.sh`

`chmod +x local_install_onionscan.sh`

`./local_install_onionscan.sh`


#### 2. you now need a way to connect into tor, and we can use docker for this:

`docker run -it -p 127.0.0.1:9050:9050 --name torproxy -d dperson/torproxy`

`docker inspect torproxy`

#### 3. note the ip address listed in the ipaddress field and then run onionscan:

`onionscan -torproxyaddress <ip address of docker container>:9050 -verbose <onion address>`

#### 4. in the local browser on the machine navigate to http://localhost:8080 to view the onion scan correlation lab:

![onionscan correlation lab](https://gitlab.com/n3ph0s/onionscan/-/raw/media/correlation.png)

#### 5. some common searches:

`snapshot` - finds all types of all data extracted.

`crawl` - finds all successful crawls.

`ssh` - find all ssh banners retrieved.

`email-address` - search for extracted email addresses.

`mod_status` - this will find hidden services potentially leaking the "real" ip address.

or you can search for the title of a hidden service from the hunchly dark web report.


# what is onionscan?

head to the original repo: https://github.com/s-rah/onionscan


