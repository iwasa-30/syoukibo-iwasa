




 
resource "aws_vpc" "main" {
  cidr_block                       = var.vpc_cidr
  instance_tenancy                 = "default"
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name    = "${var.project}-${var.environment}-vpc"
    Project = var.project
    Env     = var.environment
  }
}
# Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  availability_zone       = "ap-northeast-1a"
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name    = "${var.project}-${var.environment}-public-subnet"
    Project = var.project
    Env     = var.environment
    Type    = "public"
  }
}
resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id
  availability_zone       = "ap-northeast-1a"
  cidr_block              = var.subnet_cidr_private
  map_public_ip_on_launch = true
  tags = {
    Name    = "${var.project}-${var.environment}-private-subnet"
    Project = var.project
    Env     = var.environment
    Type    = "private"
  }
}
 