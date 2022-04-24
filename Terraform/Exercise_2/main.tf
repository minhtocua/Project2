# TODO: Designate a cloud provider, region, and credentials
# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"
  access_key = "ASIA3ZUSZAWNPG7IWJNK"
  secret_key = "x93UwKmkauxrOroNC2kSrcvhnSEf65YgtnEDmHnV"
  token = "FwoGZXIvYXdzEK///////////wEaDPkPZIhOufJUm5sQhCLVAWpmetx9+y+ckVjQXBU35YQeRg5RH1FGRoJNbLZtk32J+DD6hs35rL9rUxyvSBQ+Q3d1q8FQAzljf1J4biQNeN4g2wpau8vDm8T2Bm8U1CJPEV0qfjzRsS3ICvjgnhDtf/Ut/2SHugZTYT8DLx01m0E7hYd0WzYhQgEJuEZNc+EKzAZ66QVsub6jVCXPf6pW/XDdEvs6M4p8sQ3kIttM/GMU/53XkAxqxLnnBvge91e2t9y+lfIwj3ovsd/Nn7qJ62DsfNgzWtIXMKVmaiOOQXWmNC9aISj6no6TBjIt6B9UL5Lu0fOGfzQtV/TUB0h4GFCtslSUo6bVHCASKgcgBjh5LuCWIyxo1Oj5"
}

provider "archive" {}

data "archive_file" "zip" {
  type        = "zip"
  source_file = "greet_lambda.py"
  output_path = "greet_lambda.zip"
}

data "aws_iam_policy_document" "policy" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = "${data.aws_iam_policy_document.policy.json}"
}

resource "aws_lambda_function" "lambda" {
  function_name = "greet_lambda"

  filename         = "${data.archive_file.zip.output_path}"
  source_code_hash = "${data.archive_file.zip.output_base64sha256}"

  role    = "${aws_iam_role.iam_for_lambda.arn}"
  handler = "greet_lambda.lambda_handler"
  runtime = "python3.6"

  environment {
    variables = {
      greeting = "Hello"
    }
  }
}