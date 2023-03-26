#creating DB (in testing)
/*
variable "DB_create_alerts" {
  description = "Do you want to create RDS DB(yes/no)"
  type = string
}
*/

variable "DBInstanceIdentifier" {
  description = <<EOT
  Enter the DB name(Please provide in the form of list of Sting Ex : ["db1","db2"])
  EOT
  type    = list(string)
}

variable "tag" {
  description = <<EOT
  Enter the Env name and team name (Please provide in the form of list of Sting Ex : ["prod","ltl"])
  EOT
  type = list(string)
}

variable "metrics" {
  description = <<EOT
  available metrics are 
  -cpu
  -freeable_memory
  -freeable_storage
  -read_iops
  -write_iops
  -replica_lag(only for RR)
  -burst_balance
  -database_connnections
  -swap_usage
  Please enter the requried metrics for the DB in the form of dictionary Ex : {cpu = 90 , memory = 1073741824 #1GB in bytes}
  EOT
  type = map(number)
}

locals {
  cpu_present = contains(keys(var.metrics), "cpu")
  freeable_memory_present = contains(keys(var.metrics), "freeable_memory")
  freeable_storage_present = contains(keys(var.metrics), "freeable_storage")
  read_iops_present = contains(keys(var.metrics), "read_iops")
  write_iops_present = contains(keys(var.metrics), "write_iops")
  replica_lag_present = contains(keys(var.metrics), "replica_lag")
  burst_balance_present = contains(keys(var.metrics), "burst_balance")
  database_connnection_present = contains(keys(var.metrics), "database_connnections")
  swap_usage_present = contains(keys(var.metrics), "swap_usage")
}

variable "notification" {
  description = <<EOT
  Please Enter the SNS ARN in the form of list of string (["In-alarm SNS arn","Ok state SNS arn"])
  Ex : ["arn:aws:sns:us-east-1:723008196684:notify-pagerduty-Techops","arn:aws:sns:us-east-1:723008196684:Techops-Trac-Closer"]  #Get from SNS console
  EOT
  type = list(string)
}
