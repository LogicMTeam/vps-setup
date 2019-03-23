sudo -i
yum update -y
yum install zsh -y
chsh -s /bin/zsh root
echo $SHELL
exit
sudo -i
yum install wget git -y
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
curl -o .zshrc https://raw.githubusercontent.com/LogicMTeam/vps-setup/master/.zshrc
#coppy new .zshrc
source ~/.zshrc
cp -r /root/.oh-my-zsh /etc/skel/.oh-my-zsh
cp /root/.zshrc /usr/share
ln -f /usr/share/.zshrc /etc/skel/.zshrc
#/etc/adduser.conf
useradd -D -s /bin/bash

