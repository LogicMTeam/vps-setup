sudo -i
yum update -y
yum install nano zsh -y
chsh -s /bin/zsh root
echo $SHELL
exit
sudo -i
yum install wget git -y
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
curl -Lso .zshrc https://raw.githubusercontent.com/LogicMTeam/vps-setup/master/.zshrc
#coppy new .zshrc
source ~/.zshrc
cp -r /root/.oh-my-zsh /etc/skel/.oh-my-zsh
cp /root/.zshrc /usr/share
ln -f /usr/share/.zshrc /etc/skel/.zshrc
#/etc/adduser.conf
useradd -D -s /bin/zsh
chmod 755 /usr/share/.zshrc
exit
cp -r /etc/skel/.oh-my-zsh ~/.oh-my-zsh
cp /usr/share/.zshrc ~/.zshrc
chsh -s /bin/zsh
zsh

yum install epel-release -y
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum --enablerepo=remi,remi-php72 install -y nginx php-fpm -y
yum --enablerepo=remi,remi-php56 install -y php-common php-opcache php-pecl-apcu php-cli php-pear php-pdo php-mysqlnd php-pgsql php-pecl-mongo php-pecl-sqlite php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml php-mysql -y
#start service
systemctl stop httpd.service
systemctl start nginx.service
systemctl start php-fpm.service
#change autostart
systemctl disable httpd.service
systemctl enable nginx.service
systemctl enable php-fpm.service
nano /etc/nginx/conf.d/default.conf

yum install -y mariadb mariadb-server
systemctl start mariadb.service
systemctl enable mariadb.service
/usr/bin/mysql_secure_installation

yum install composer

#beanstalk
wget http://cbs.centos.org/kojifiles/packages/beanstalkd/1.9/3.el7/x86_64/beanstalkd-1.9-3.el7.x86_64.rpm
rpm -ivh beanstalkd-1.9-3.el7.x86_64.rpm
systemctl enable beanstalkd
systemctl start beanstalkd
ps aux | grep beanstalkd

#redis
yum install redis
systemctl enable redis
systemctl start redis

#
yum install libpng-devel

#install npm
#update mariadb to 10.3 to fix length limit 767
https://www.digitalocean.com/community/questions/how-do-i-upgrade-from-mariadb-5-5-to-10-1-on-centos7

