region = "ap-southeast-1"       // Enter your aws region name 

access_keys = "xxxxxxxxxxxxxxx" // Enter your access Key

secret_keys = "yyyyyyyyyyyyyyy" // Enter your Secret Key 


#---------------- S3 -------------------

Enter_Bucket_Name_1 = "tesr-11-terrafom-s3-bucker"  // Enter your 1st bucket name unic

Enter_Bucket_Name_2 = "tesr-22-terrafom-s3-bucker"  // // Enter your 2nd bucket name unic

Enter_ACL_1 = "public-read"      // Enter your ACL : public, private, public-read, etc..

Enter_ACL_2 = "private"               // Enter your ACL : public, private, public-read, etc..

Enter_Bucket_Versioning = "true"       // Enter your Bucket Versioning  EX : true/false

Enter_Bucket_Default_Encryption_Key_Enabled = "true"   // Enter your bucket default encryption key enabled EX : true/false

Enter_Bucket_Tag_Owner = "Atul"  // Enter bucker  owner tag name 

Enter_Bucket_Tag_CanBeDelete = "Yes"   // Enter bucker CanBeDelete tag  EX : Yes/No 

Enter_Static_Website_Bucket_Index_Document = "index.html"   // Enter your static website formate. mostly use index.html   EX : index.html

Enter_Static_Website_Bucket_Error_Document = "error.html"   // Enter your static website formate. mostly use error.html   EX : error.html and 404.html


   
#------------- CodeCommit --------------


Enter_CodeCommit_Repository_Name = "terraform-repo-FE"  // Enter your repository name

Enter_CodeCommit_Description = "This is terraform test repository you can delete it?"   // Enter your repository description 

Enter_CodeCommit_Tag_Owner = "Atul"  // Enter codecommit repo. tag owner EX : Atul

Enter_CodeCommit_Tag_CanBeDelete = "Yes"  // Enter codecommit repo. canbedelete EX : Yes/No


#------------- CodeBuild --------------

Enter_CodeBuild_Project_Name = "terraform-test-code-build"   // Enter your codebuild project name EX : terraform-codebuild

Enter_CodeBuild_Project_Description = "This is testing terraform codebuild"  // Enter your codebuild project descriptions

Enter_CodeBuild_Service_Role_Name = "test-3-terraform-codebuild-service-role"  // Enter codebuild service role name

Enter_CodeBuild_Tag_Owner = "Atul"  // Enter CodeBuild Owner Name EX : Atul

Enter_CodeBuild_Tag_CanBeDelete = "Yes" // Enter CodeBuild CanBeDelete EX : Yes/No

#------------- CodePipeline --------------

Enter_CodePipeline_Pipeline_Name = "terraform-pipeline"   // Enter CodePipeline Name your here EX : test-pipeline

Enter_CodePipeline_Enter_CodeCommit_Repo_Branch_Name = "master"  // Enter your CodeCommit repository branch name EX : master/main

Enter_CodePipeline_Enter_S3_Bucket_Name = "codepipeline-store-artifact-files" // Enter bucket name for store all artificats

Enter_CodePipeline_Tag_Owner = "Atul"      // Enter CodePipeline Tag owner Name EX : Atul

Enter_CodePipeline_Tag_CanBeDelete = "yes"   // Enter CodePipeline Tag canbedelete EX : Yes/No

Enter_CodePipeline_AWS_IAM_Role_Name = "test-3-terraform-role-name"   // Enter CodePipeline IAM Role Name EX : test-1-terraform-role-name

Enter_CodePipeline_AWS_IAM_Role_Policy_Name  = "test-3-terraform-role-policy-name"  // Enter Codepipeline IAM Role Policy Name EX : test-1-terraform-role-name