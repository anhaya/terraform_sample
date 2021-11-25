# Terraform Sample

## Objetivo
O objetivo deste projeto é servir como
base e consulta para a criação de outros projetos terraforms. Abaixo, descrevo
um cenário que servirá como apoio para a implementação do código apresentado
. Tomando esse cenário como base aproveitei para "codar" mais de uma solução,
usando diversos conceito como "workspace", "modules", "resources", "input variable",
"local variable", "output variable", "backend configuration" entre outros a fim de usarmos como
base para consulta e ou criação.

## Cenário

Você tem uma aplicação que está dividida em três contas AWS e você
precisa automatizar a criação de um DynamoDB.

* DEV
    * Conta usada para fazer testes na aplicação de maneira mockada e com pouca integração. O Dynamodb deve conter a tag “DEV”
* HML
    * Conta usada para fazer testes na aplicação de maneira integrada. O Dynamodb deve conter a tag “HML”
* PRD
    * Conta usada para disponibilizar a aplicação para os usuários finais. O Dynamodb deve conter a tag “PRD”

## Solução
1. Usar um backend apontando para o S3 com workspace. Neste caso, o terraform state ficaria em um S3 de produção/devops e o workspace definiria para qual terraform state e profile AWS olhar na execução

2. Usar um backend apontando para o S3 sem workspace. Neste caso, o terraform state ficaria em um S3 em cada conta AWS e via variável de ambiente definiríamos para qual terraform state e profile AWS olhar na execução

3. Usar backend remoto com Terraform Cloud

## Links
https://www.terraform-best-practices.com/naming

