
# Backend S3 - Solução 1

## Descrição

Dado o cenário apresentado neste repositorio,
este código implementa a solução 1. Backend configurado com S3 e utilizando
workspace.

## Setup

1. Instalar terraform cli
2. Instalar AWS cli
3. Configurar arquivo de credentials (vim ~/.aws/credentials) do terraform conforme abaixo:
```python
[default]
aws_access_key_id = <access key>
aws_secret_access_key = <secret key>
[account-dev]
aws_access_key_id = <access key>
aws_secret_access_key = <secret key>
[account-hml]
aws_access_key_id = <access key>
aws_secret_access_key = <secret key>
[account-prd]
aws_access_key_id = <access key>
aws_secret_access_key = <secret key>
```
4. Criar bucket para armazenar o terraform state, pode ser em qual quer conta.
5. No arquivo main.tf fazer as seguintes alterações:
* Mudar o valor da região AWS, esta como "us-east-1", se necessário, mude para a qual você irá utilizar
* Mude o nome do bucket para o qual você criou acima, no código está como "carlosanhaya-terraform-backend-state"
* No código o terraform state esta configurado para ser lido de conta de produção, se necessário, mude para a conta ao qual você deseja
6. Criar workspaces conforme abaixo
```python
terraform workspace new dev
terraform workspace new hml
terraform workspace new prd
```
## Deployment
1. Iniciar os módulos
```python
terraform init
```
2. Selecionar workspace
```python
terraform workspace select dev
```
3. Aplicar utilizando o respectivo arquivo de inicialização de variaveis
```python
terraform apply -var-file=terraform.dev.tfvars
```

## Links de apoio

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

https://www.terraform.io/docs/language/settings/backends/s3.html

https://www.terraform.io/docs/language/state/workspaces.html

https://learn.hashicorp.com/tutorials/terraform/install-cli

