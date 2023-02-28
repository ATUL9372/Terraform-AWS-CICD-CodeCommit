resource "aws_codepipeline" "aws_local_codepipeline" {
  name     = "${var.Enter_CodePipeline_Pipeline_Name}"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.aws_local_codepipeline_bucket.bucket
    type     = "S3"

    # encryption_key {
    #   id   = data.aws_kms_alias.s3kmskey.arn
    #   type = "KMS"
    # }
  }


### Source Stage : CodeCommit 


  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        RepositoryName = "${var.Enter_CodeCommit_Repository_Name}"
        BranchName       = "${var.Enter_CodePipeline_Enter_CodeCommit_Repo_Branch_Name}"
      }
    }
  }


### Source Stage : CodeBuild

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = "${var.Enter_CodeBuild_Project_Name}"
      }
    }
  }


### Source Stage : CodeDeploy

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      input_artifacts = ["build_output"]
      version         = "1"

      configuration = {
        BucketName = "${var.Enter_Bucket_Name_1}"
        Extract = true
      //  ObjectKey  = "${var.Enter_Bucket_Name_1}"

      }
    }
  }

  tags = {
    Owner = "Atul"
    CanBeDelete = "Yes"
  }


} 


resource "aws_s3_bucket" "aws_local_codepipeline_bucket" {
  bucket = "${var.Enter_CodePipeline_Enter_S3_Bucket_Name}"
  acl = "private"
}

resource "aws_iam_role" "codepipeline_role" {
  name = "${var.Enter_CodePipeline_AWS_IAM_Role_Name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "${var.Enter_CodePipeline_AWS_IAM_Role_Policy_Name}"
  role = aws_iam_role.codepipeline_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Action": [
        "codecommit:*",
        "codebuild:*",
        "codedeploy:*",
        "codepipeline:*"
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

