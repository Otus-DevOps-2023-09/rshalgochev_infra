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

### ДЗ №4 ###
Собран базовый образ (FRY) с помощью утилиты paker, для полноценного запуска приложения требуются дополнительные ручные
действия. Чтобы минимизировать ручные действия был собран полный образ (BAKE) содержащий все необходимые зависимости.
Для запуска приложения достаточно создать ВМ из этого образа. Для этого можно воспользоваться скриптом
create-reddit-vm.sh, который расположен в каталоге config-scripts.
При создании образа столкнулся с ошибкой работы apt, поэтому пришлось применить костыль в виде остановки процессов apt
и apt-get и зачистки кэша apt.
Чтобы собрать свой образ необходимо сперва заполнить файл variables.json, пример заполнения можно посмотреть в файле
variables.json.example. После чего выполнить команду:
```shell
packer build -var-file=variables.json immutable.json
```

### ДЗ № 6 ###
Настроен деплой прилодения через terraform. Также создается балансировщик нагрузки. Чтобы запустить самостоятельно
необходимо заполнить значения в файле terraform.tfvars, за образец необходимо взять terraform.tfvars.example.
После этого находяс каталоге terraform выполнить команду
```shell
terraform init
```
Далее после установки провайдера выполняем
```shell
terraform plan
```
И затем
```shell
terraform apply
```
И подтвердить выполнение
После создания инстанстов в консоль будут выведены их внешние IP-адреса, а такще внешний IP-адрес балансировщика
нагрузки. Чтобы проверить работу прилодения достаточно ввести в адресной строке браузера внещний адрес балансировщика.
