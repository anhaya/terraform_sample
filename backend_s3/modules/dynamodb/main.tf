resource "aws_dynamodb_table" "cliente-dynamodb-table" {
  name           = "tb_cliente"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "cpf"
  range_key      = "dt_nascimento"

  attribute {
    name = "cpf"
    type = "S"
  }

  attribute {
    name = "dt_nascimento"
    type = "S"
  }

  ttl {
    attribute_name = "time_to_live"
    enabled        = false
  }

  tags = {
    Name        = "cliente-dynamodb-table"
    Environment = terraform.workspace
  }
}