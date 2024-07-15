# Terraform VM Dataline

## 1) Установка терраформ
### Варианты установки
- Для установки без VPN можно скачать Terraform из [зеркала](https://hashicorp-releases.yandexcloud.net/terraform)
- Скачать исполняемый файл с сайта terraform.io
- Установить с помощью пакетных менеджеров (apt, yum, brew, chocolatey и т. д.)
- Скачать исходные файлы с GitHub, скомпилировать с помощью Golang
- Скачать с Docker Hub образ с установленным Terraform

### Настройка зеркала провайдеров для terraform

```
cat <<EOF > ~/.terraformrc
provider_installation {
  network_mirror {
    url = "https://terraform-mirror.yandexcloud.net/"
    include = ["registry.terraform.io/*/*"]
  }
  direct {
    exclude = ["registry.terraform.io/*/*"]
  }
}
EOF
```

## 2) Хранение и использование персональных данных

```mv personal.auto.tfvars-example personal.auto.tfvars``` выполнить команду и заполнить данные в файле personal.auto.tfvars.

