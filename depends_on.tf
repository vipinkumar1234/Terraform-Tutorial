resource "aws_instance" "web" {
  ami           = "ami-0dbc3d7bc646e8516"
  instance_type = "t3.micro"
  depends_on = [aws_s3_bucket.My_Bucket]
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_s3_bucket" "My_Bucket" {
  bucket = "mytestbucketforyoutubehjejhehj7363773"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}