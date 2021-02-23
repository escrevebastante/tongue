# About the project:<br>
This is a local documentation search engine based on official documentation releases of multiple linux projects. <br><br>
The idea is to make a local offline copy of all available documentation and after use grep to search for what you are looking for. The advantage here is that you can search on multiple documentation pages for different projects at the same time. Some sort of "offline documentation search engine running on CMD".<br><br>
The tongue-update.sh script will take care of downloading the pages for you while tongue.sh will prompt you with what is needed to perform the search you want. Note that the search is performed through html and pdf files<br><br>

# Installation and usage:<br>
0 - Install pdfgrep in your system (available via apt-get, yum, etc)<br><br>
1 - Download the tongue-update.sh and tongue.sh scripts<br><br>
2 - Set execution permissions to both scripts: "sudo chmod a+x tongue-update.sh ; sudo chmod a+x tongue.sh"<br><br>
3 - Copy the scripts to /usr/bin with: "sudo cp tongue-update.sh /usr/bin/tongue-update ; sudo cp tongue.sh /usr/bin/tongue"<br><br>
4 - Run "tongue-update" command first to download the html and pdf files. By default, these files are saved in "$HOME/Documents/". You can change that also by editing the script before the first run. It might be a good idea to set a cronjob to also run the tongue-update.sh automatically. The tongue-update.sh is set to download new documentation htmls ONLY if a new version is in place on the website. PNG,JPEG,JPG,SVG and CSS files are also saved in case you want to browse the documentation offline in your browser<br><br>
5 - After the download is done, run tongue to start searching.<br><br>

# Examples:<br>
List documentations or ask for help: tongue -h or -l"<br>
Image search: tongue -t CLOUD-INIT -s SEARCH -I (options: -i for case-insensitive search)"<br>
Ubuntu Documentation search: tongue -u DOCUMENTATION -s SEARCH_STRING (options: -i for case-sensitive search)"<br>
Kubernetes documentation: tongue -k RELEASENOTE -s SEARCH_STRING (options: -i for case-sensitive search)"<br>
Search on all openstack documentation: tongue -e '\*' -s 'nova' <br>
Search for 'ocfs2' or 'nfs' on systemd documentation: tongue -y '\*' -s ocfs2\|nfs <br><br>

# Option list:<br>
-a, --calibre = Search on Calibre library<br>
-b, --rabbitmq = Search on rabbitmq official documentation<br>
-c, --ceph = Search on Ceph official documentation<br>
-d, --docker-enterprise = Search on docker enterprise documentation<br>
-e, --openstack = Search on openstack official documentation<br>
-f, --container-cloud = Search on mirantis container cloud documentation<br>
-g, --man-pages = Search on linux man pages<br>
-h, --help = Display a list of options to chose from<br>
-i, --case-sensitive = Searches are case sensitive.<br>
-I, --image = Search for png files only. If you use this option, you need to specify -c, -e, -k, -t or -y<br>
-j, --mos = Search on mirantis MOS documentation<br>
-k, --kubernetes = Search on kubernetes official documentation<br>
-l, --list = Display a list of documentations that you can select<br>
-m, --mcp = Search on mirantis MCP documentation<br>
-n, --kernel = Search on kernel official documentation<br>
-o, --module = Search on kernel module database<br>
-s, --search = Search string. If you are searching for more then one word, put all into quotes ''<br>
-t, --cloud-init = Search on cloud-init documentation<br>
-u, --ubuntu = Search on ubuntu official documentation<br>
-y, --systemd = Search on systemd official documentation<br><br>

# Practical examples:<br>
Search only on multiple e-books/authors: tongue -c '\*Sebastian\*' -s 'system wide trusted certificate'<br>
"Search only on ubuntu 16.x documentation pages: tongue -u '\*16\*' -s 'system wide trusted certificate'<br>
Search on all openstack documentation: tongue -e '*' -s 'nova'<br>
Search for 'ocfs2' or 'nfs' on systemd documentation: tongue -y '*' -s ocfs2\|nfs<br><br>

6 - A list of html files will be displayed on the left side. Do Ctrl+Click on the links to open them in your webrowser. Once you find what you need, open the page you downloaded with your browser (i suggest using w3m if you want to open that from the terminal. If you want to display images through w3m, dont forget to install "xv" and "w3m-inline-image" packages)<br>
7 - Enjoy<br>

# Screenshots:
![Screenshot_2020-05-08_13-00-06](https://user-images.githubusercontent.com/21173715/81400390-3f503b80-912d-11ea-9f1e-d91271d3c042.png)

![Screenshot_2020-05-08_13-00-32](https://user-images.githubusercontent.com/21173715/81400391-3fe8d200-912d-11ea-9bfc-5245bce964f9.png)
