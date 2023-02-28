############################   S3_Bucket_1     ############################ 

resource "aws_s3_bucket" "s3_bucket_1" {
  bucket = "${var.Enter_Bucket_Name_1}"  // Enter Your Bucker Name
  acl    = "${var.Enter_ACL_1}"          // Enter your ACL 

// Bucker versioning 
  versioning {
    enabled = "${var.Enter_Bucket_Versioning}"
  }

// S3 Default encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    bucket_key_enabled = "${var.Enter_Bucket_Default_Encryption_Key_Enabled}"
    }
  }

// Enable Static Website
  website {
    index_document = "${var.Enter_Static_Website_Bucket_Index_Document}"
    error_document = "${var.Enter_Static_Website_Bucket_Error_Document}"
  }


// Enter your bucker tags
  tags = {
    Owner = "${var.Enter_Bucket_Tag_Owner}"
    CanBeDelete = "${var.Enter_Bucket_Tag_CanBeDelete}"
  }
  
}

///     Enter your s3 bucket policy     ///

resource "aws_s3_bucket_policy" "s3_bucket_1_policy" {
  bucket = aws_s3_bucket.s3_bucket_1.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.Enter_Bucket_Name_1}/*"
            ]
        }
    ]
}
POLICY

}



#================================================================================================================================================================


############################   S3_Bucket_2     ############################ 

resource "aws_s3_bucket" "s3_bucket_2" {
  bucket = "${var.Enter_Bucket_Name_2}"  // Enter Your Bucker Name
  acl    = "${var.Enter_ACL_2}"          // Enter your ACL 

// Bucker versioning 
  versioning {
    enabled = "${var.Enter_Bucket_Versioning}"
  }

// S3 Default encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    bucket_key_enabled = "${var.Enter_Bucket_Default_Encryption_Key_Enabled}"
    }
  }

// Enable Static Website
  website {
    index_document = "${var.Enter_Static_Website_Bucket_Index_Document}"
    error_document = "${var.Enter_Static_Website_Bucket_Error_Document}"
  }


// Enter your bucker tags
  tags = {
    Owner = "${var.Enter_Bucket_Tag_Owner}"
    CanBeDelete = "${var.Enter_Bucket_Tag_CanBeDelete}"
  }
  
}

///     Enter your s3 bucket policy     ///

resource "aws_s3_bucket_policy" "s3_bucket_2_policy" {
  bucket = aws_s3_bucket.s3_bucket_2.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.Enter_Bucket_Name_2}/*"
            ]
        }
    ]
}
POLICY

}


# ///     Bucket Object is Optional       ///
# resource "aws_s3_bucket_object" "s3_bucket_1_object" {
#   bucket = aws_s3_bucket.s3_bucket_1.id   // Enter Lable_1 and . Label_2.id 
#   key    = "index.html"                 //
#   source = "index.html"                 // Enter full path of file locations
#   content_type = "text/html"

# }