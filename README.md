# Introduction
Development Environment for Apache HTTPD + PHP + MySQL

# Tested On Virtual Environment
## Environment1
1. Host Operating System: Windows 10 Pro 64bit
2. cmder v1.3.19 (ConEmu v210912 [64] {Stable}); https://cmder.app; Download: https://github.com/cmderdev/cmder/releases/download/v1.3.19/cmder.zip
3. Oracle VM VirtualBox v6.1.36; https://www.virtualbox.org; Download: https://download.virtualbox.org/virtualbox/6.1.36/VirtualBox-6.1.36-152435-Win.exe
4. Vagrant v2.3.0; https://www.vagrantup.com; Download: https://releases.hashicorp.com/vagrant/2.3.0/vagrant_2.3.0_windows_amd64.msi
5. Vagrant Box: ubuntu/focal64

# Software and Dependency
1. expat v2.4.8
2. apr v1.7.0
3. apr-util v1.6.1
4. pcr2 v10.40
5. httpd v2.4.54
6. php v8.1.10

# Starting Apache HTTPD
```
prompt> sh /opt/apache-httpd/httpd/bin/apachectl -k start
```

# Accessing Apache HTTPD from Host VM
1. Create SSH Tunnel, with following details
	- Type: Local
	- Forward port: 8080
	- Destination server: localhost:8080
	- SSH server: vagrant@localhost:2222
2. Open a web browser at Host VM, and browse following URL: http://localhost:8080

# Stopping Apache HTTPD
```
prompt> sh /opt/apache-httpd/httpd/bin/apachectl -k stop
```