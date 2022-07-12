
# Fetch AWS Axway V7 AMI identifier
data "aws_ami" "workshop0001-axwayv7" {
  most_recent = true
  owners      = ["self"]
  filter {
    name = "tag:Name"
    values = [
      "techlab-axwayv7",
    ]
  }
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}


# This gets your IP from a simple HTTP request - note it's V4.
#data "http" "myip" {
#  url = "https://api.ipify.org"
#}






















