variable "env" {
  description = <<EOT
    Enter the Env name and team name (Please provide in the form of list of Sting Ex : ["prod","ltl"])
  EOT
  type = list(string)
}

variable "db_name" {
  description = <<EOT
  Enter the DB name(Please provide in the form of list of Sting Ex : ["db1","db2"])
  EOT
  type    = list(string)
}

variable "notification" {
  description = <<EOT
  Enter the action group :
  EOT
  type = string
}

variable "metrics" {
  description = <<EOT
  available metrics are 
  -cpu
  -memory
  -storage
  -io_consumption_percent
  -active_connections
  -serverlog_storage_percent
  -connections_failed
  Please enter the requried metrics for the DB in the form of dictionary Ex : {cpu = 90 , memory = 1073741824 #1GB in bytes}
  EOT
  type = map(number)
}
locals {
  #present = contains(keys(var.metrics), "cpu")? "CPUUtilization" :0
  cpu_present = contains(keys(var.metrics), "cpu")
  memory_present = contains(keys(var.metrics), "memory")
  storage_present = contains(keys(var.metrics),"storage")
  io_consumption_percent_present = contains(keys(var.metrics),"io_consumption_percent")
  active_connections_present = contains(keys(var.metrics),"active_connections")
  serverlog_storage_precent_present = contains(keys(var.metrics),"serverlog_storage_percent")
  connections_failed_present = contains(keys(var.metrics),"connections_failed")
}
