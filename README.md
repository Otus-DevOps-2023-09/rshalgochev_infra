# rshalgochev_infra
rshalgochev Infra repository

### Доступ на ВМ без публичного адреса через хост bastion в одну строку: ###
```shell
ssh -i ~/.ssh/key -A -J bastion_username@bastion_ip host_username@host_ip
```
Либо можно данную команду обернуть в алиас:
```shell
alias someinternalhost='ssh -i ~/.ssh/yacloud -A -J bastion_username@bastion_ip host_username@host_ip'
```
Чтобы созданный алиас не приходилось вводить в каждой новой сессии терминала, его модно прописать в ~/.bash_profile
или ~./zprofile в зависимости от используемой оболочки.
Чтобы изменения вступили в силу немедленно модно выполнить следующую команду:
```shell
source ~/.bash_profie
source ~/.zprofile
```
### Данные для подкллючения к bastion: ###
bastion_IP = 158.160.34.10
someinternalhost_IP = 10.128.0.18

### Данные для проверки ДЗ №4 ###
testapp_IP = 51.250.15.85
testapp_port = 9292

### Комманда для создания ВМ ###
'''shell
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=startup.yml
'''
