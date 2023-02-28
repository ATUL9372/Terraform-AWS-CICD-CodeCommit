resource "aws_codecommit_repository" "aws_local_codecommit" {
  repository_name = "${var.Enter_CodeCommit_Repository_Name}"
  description     = "${var.Enter_CodeCommit_Description}"

  tags = {
    Name = "${var.Enter_CodeCommit_Repository_Name}"
    Owner = "${var.Enter_CodeCommit_Tag_Owner}"
    CanBeDelete = "${var.Enter_CodeCommit_Tag_CanBeDelete}"
  }

}