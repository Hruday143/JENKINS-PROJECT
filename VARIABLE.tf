# variables.tf

variable "region" {
  description = "The AWS region to deploy to"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "instance_tags" {
  description = "List of tags for each instance"
  type        = list(map(string))
  default = [
    { Name = "jenkins-instance" },
    { Name = "tomcat-instance" },
    { Name = "nexus-instance" },
    { Name = "sonarqube-instance" },
    { Name = "Monitoring-instance" } # Additional instance if needed
  ]
}

variable "instance_types" {
  description = "List of instance types for each instance"
  type        = list(string)
  default     = ["t2.micro", "t2.micro", "t2.medium", "t2.medium", "t2.medium"]
}

variable "volume_sizes" {
  description = "Map of instance names to EBS volume sizes (in GB)"
  type        = map(number)
  default = {
    "jenkins-instance"   = 8 # Default size
    "tomcat-instance"    = 8 # Default size
    "nexus-instance"     = 20
    "sonarqube-instance" = 20
    "web-instance"       = 21 # Default size for additional instance
  }
}

variable "key_name" {
  description = "Key pair name for SSH access"
  default     = "HRUDAY-KEYPAIR"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  default     = "jenkins-project-artifactory"
}

variable "ami_id" {
  description = "Amazon-LINUX AMI ID (Free tier eligible)"
  default     = "ami-03972092c42e8c0ca" # Example Amazon-LINUX AMI in us-east-1, ensure to verify and update accordingly
}
