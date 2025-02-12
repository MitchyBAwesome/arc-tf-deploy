variable "aws_region" {
  description = "The region where to deploy this code (e.g. us-east-1)."
  default     = "ap-southeast-2"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "xxx.dkr.ecr.ap-southeast-2.amazonaws.com/arc-jupyter:scala_2.12"
}

variable "container_name" {
  description = "Docker Container name in ECS cluster"
  default     = "arc-jupyter"
}


variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 8888
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = "1"
}


# The maximum number of containers that should be running.
# used by both autoscale-perf.tf and autoscale.time.tf
variable "ecs_autoscale_max_instances" {
  default = "2"
}


variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "myEcsTaskExecutionRole"
}

variable "ecs_auto_scale_role_name" {
  description = "ECS auto scale role Name"
  default     = "myEcsAutoScaleRole"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "4096"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "20480"
}

variable "access_secret_arn" {
  description = "secret manager Arn for s3 access secret"
  default     = "blah"
}

variable "access_key_arn" {
  description = "secret manager Arn for s3 access key"
  default     = "blahblah"
}

