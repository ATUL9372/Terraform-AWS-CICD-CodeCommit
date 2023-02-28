variable access_keys {    
  type = string
}

variable secret_keys {      
  type = string
}

variable region {
  type = string
}

## S3 Bucket

variable Enter_Bucket_Name_1 {
    type = string  
}

variable Enter_Bucket_Name_2 {
    type = string  
}


variable Enter_ACL_1 {
  type = string
}

variable Enter_ACL_2 {
  type = string
}

variable Enter_Bucket_Versioning {
  type = string
}

variable Enter_Bucket_Default_Encryption_Key_Enabled {
  type = string  
}

variable Enter_Bucket_Tag_Owner {
  type = string
}

variable Enter_Bucket_Tag_CanBeDelete {
  type = string
}

variable Enter_Static_Website_Bucket_Index_Document {
  type = string
}

variable Enter_Static_Website_Bucket_Error_Document {
  type = string
}


######### CodeCommit ########

variable Enter_CodeCommit_Repository_Name {
  type = string
}

variable Enter_CodeCommit_Description {
  type = string
}

variable Enter_CodeCommit_Tag_Owner {
  type = string
}

variable Enter_CodeCommit_Tag_CanBeDelete {
  type = string
}

######## CodeBuild ############

variable Enter_CodeBuild_Project_Name {
  type = string
}

variable Enter_CodeBuild_Project_Description {
  type = string
}

variable Enter_CodeBuild_Service_Role_Name {
  type = string
}


variable Enter_CodeBuild_Tag_Owner {
  type = string
}

variable Enter_CodeBuild_Tag_CanBeDelete {
  type = string
}

######## CodePipeline ############


variable Enter_CodePipeline_Pipeline_Name {
  type = string
}

variable Enter_CodePipeline_Enter_CodeCommit_Repo_Branch_Name {
  type = string
  default = "master"
}


variable Enter_CodePipeline_Enter_S3_Bucket_Name {
  type = string

}

variable Enter_CodePipeline_Tag_Owner {
  type = string

}

variable Enter_CodePipeline_Tag_CanBeDelete {
  type = string

}

variable Enter_CodePipeline_AWS_IAM_Role_Name {
  type = string

}

variable Enter_CodePipeline_AWS_IAM_Role_Policy_Name  {
  type = string
}
