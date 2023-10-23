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
