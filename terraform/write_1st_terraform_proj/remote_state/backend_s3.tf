#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/*terraform s3 backend dynamodb
This is a backend for statefile to interconnect s3 & dynamodb
Terrform internally knows if a backend for initiated for s3 states dynamodb table it understand that user is stroing statefiles.*/
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
terraform{
backend "s3"{
bucket = "044744846279-terraform-states"
#name of the bukcet
key = "dev/app.tfstate"
#key is where we want to store the .tfstate file in the s3
#if we dont have any directory in s3 it will create but not .tf files
region="us-east-1"
encrypt="true"
dynamodb_table="terraform-lock"
use_lockfile=true
}
}
