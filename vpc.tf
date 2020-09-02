
resource "aws_vpc" "main_tf" {
  cidr_block           = "172.30.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main_tf_1" {
  vpc_id            = aws_vpc.main_tf.id
  cidr_block        = "172.30.0.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main_tf_2" {
  vpc_id            = aws_vpc.main_tf.id
  cidr_block        = "172.30.1.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "second"
  }
}

resource "aws_subnet" "main_tf_3" {
  vpc_id            = aws_vpc.main_tf.id
  cidr_block        = "172.30.2.0/24"
  availability_zone = "eu-central-1c"

  tags = {
    Name = "third"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_tf.id

  tags = {
    Name = "main"
  }
}

data "aws_route_table" "selected" {
  vpc_id = aws_vpc.main_tf.id
}

resource "aws_route" "route" {
  route_table_id         = data.aws_route_table.selected.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}
