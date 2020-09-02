resource "aws_iam_role" "cloudwatch_logs" {
  name = "cloudwatch_logs"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "cloudwatch-logs"
  }
}

resource "aws_iam_instance_profile" "cloudwatch_logs-instanceprofile" { 
  name = "cloudwatch-logs"                                              
  role = aws_iam_role.cloudwatch_logs.name                              
}                                                                       
resource "aws_iam_role_policy" "cloudwatch_policy" {
  name   = "cloudwatch_policy"
  role   = aws_iam_role.cloudwatch_logs.id
   policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogStreams"
    ],
      "Resource": [
        "arn:aws:logs:*:*:*"
    ]
  }
 ]
}
EOF
}