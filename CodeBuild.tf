resource "aws_iam_role" "codebuild-service-role" {
  name = "${var.Enter_CodeBuild_Service_Role_Name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_role_policy" "codebuild_policy" {
  name = "${var.Enter_CodeBuild_Service_Role_Name}"
  role = aws_iam_role.codebuild-service-role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Action": [
        "codecommit:*",
        "codebuild:*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "cloudwatch:*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

// direct attached any policy using aws_iam_role_policy_attachment resource
resource "aws_iam_role_policy_attachment" "codebuild-service-role-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  role = aws_iam_role.codebuild-service-role.name
}



resource "aws_codebuild_project" "aws_local_codebuild" {
  name          = "${var.Enter_CodeBuild_Project_Name}"
  description   = "${var.Enter_CodeBuild_Project_Description}"
  build_timeout = "5"
  service_role  = aws_iam_role.codebuild-service-role.arn

  source {
    type            = "CODECOMMIT"
    location        = aws_codecommit_repository.aws_local_codecommit.clone_url_http

}  

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:6.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

#   vpc_config {
#     vpc_id = aws_vpc.example.id

#     subnets = [
#       aws_subnet.example1.id,
#       aws_subnet.example2.id,
#     ]

#     security_group_ids = [
#       aws_security_group.example1.id,
#       aws_security_group.example2.id,
#     ]
#   }

  logs_config {
    cloudwatch_logs {
      group_name  = "/aws/codebuild/aws_codebuild_project.aws_local_codebuild.name"
      stream_name = "{build-id}"
    }
}

  tags = {
    Owner = "${var.Enter_CodeBuild_Tag_Owner}"
    CanBeDelete = "${var.Enter_CodeBuild_Tag_CanBeDelete}"
  }

}

// tag code commit
// reduce service role permission
// 