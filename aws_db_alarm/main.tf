#This function is to create the alert for CPU
resource "aws_cloudwatch_metric_alarm" "CPU_Alarm" {
  count = local.cpu_present ? length(var.DBInstanceIdentifier) : 0
  alarm_name          = "Critical | AWS INF | RDS |  ${element(var.DBInstanceIdentifier, count.index)} | CPU Utilisation breached Upper Threshold"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 60
  statistic           = "Average"
  threshold           = var.metrics["cpu"]
  alarm_actions       = ["arn:aws:sns:us-east-1:723008196684:notify-DBA-Pager",var.notification[0]]
  ok_actions          = [var.notification[1]]
  dimensions = {
    DBInstanceIdentifier = element(var.DBInstanceIdentifier, count.index)
}
}

#This function is to create the alert for Memory
resource "aws_cloudwatch_metric_alarm" "Memory_Alarm" {
  count = local.freeable_memory_present ? length(var.DBInstanceIdentifier) : 0
  alarm_name          = "Critical | AWS INF | RDS |  ${element(var.DBInstanceIdentifier, count.index)} | FreeableMemory breached Lower Threshold"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = 60
  statistic           = "Average"
  threshold           = var.metrics["freeable_memory"]
  alarm_actions       = ["arn:aws:sns:us-east-1:723008196684:notify-DBA-Pager",var.notification[0]]
  ok_actions          = [var.notification[1]]
  dimensions = {
    DBInstanceIdentifier = element(var.DBInstanceIdentifier, count.index)
}
}

#This function is to create the alert for Storage
resource "aws_cloudwatch_metric_alarm" "Storage_Alarm" {
  count = local.freeable_storage_present ? length(var.DBInstanceIdentifier) : 0
  alarm_name          = "Critical | AWS INF | RDS |  ${element(var.DBInstanceIdentifier, count.index)} | FreeStorageSpace Utilisation breached Upper Threshold"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = 60
  statistic           = "Average"
  threshold           = var.metrics["freeable_storage"]
  alarm_actions       = ["arn:aws:sns:us-east-1:723008196684:notify-DBA-Pager",var.notification[0]]
  ok_actions          = [var.notification[1]]
  dimensions = {
    DBInstanceIdentifier = element(var.DBInstanceIdentifier, count.index)
}
}

#This function is to create the alert for Read_IOPS
resource "aws_cloudwatch_metric_alarm" "Read_IOPS_Alarm" {
  count = local.read_iops_present ? length(var.DBInstanceIdentifier) : 0
  alarm_name          = "Critical | AWS INF | RDS |  ${element(var.DBInstanceIdentifier, count.index)} | ReadIOPS Utilisation breached Upper Threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "ReadIOPS"
  namespace           = "AWS/RDS"
  period              = 60
  statistic           = "Average"
  threshold           = var.metrics["read_iops"]
  alarm_actions       = ["arn:aws:sns:us-east-1:723008196684:notify-DBA-Pager",var.notification[0]]
  ok_actions          = [var.notification[1]]
  dimensions = {
    DBInstanceIdentifier = element(var.DBInstanceIdentifier, count.index)
}
}

#This function is to create the alert for Write_IOPS
resource "aws_cloudwatch_metric_alarm" "Write_IOPS_Alarm" {
  count = local.write_iops_present ? length(var.DBInstanceIdentifier) : 0
  alarm_name          = "Critical | AWS INF | RDS |  ${element(var.DBInstanceIdentifier, count.index)} | WriteIOPS Utilisation breached Upper Threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "ReadIOPS"
  namespace           = "AWS/RDS"
  period              = 60
  statistic           = "Average"
  threshold           = var.metrics["write_iops"]
  alarm_actions       = ["arn:aws:sns:us-east-1:723008196684:notify-DBA-Pager",var.notification[0]]
  ok_actions          = [var.notification[1]]
  dimensions = {
    DBInstanceIdentifier = element(var.DBInstanceIdentifier, count.index)
}
}

#This function is to create the alert for Replica_Lag (Only for RR)
resource "aws_cloudwatch_metric_alarm" "Replica_Lag_Alarm" {              
  count = local.replica_lag_present ? length(var.DBInstanceIdentifier) : 0
  alarm_name          = "Critical | AWS INF | RDS |  ${element(var.DBInstanceIdentifier, count.index)} | Replica Lag breached Upper Threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "ReadIOPS"
  namespace           = "AWS/RDS"
  period              = 60
  statistic           = "Average"
  threshold           = var.metrics["replica_lag"]
  alarm_actions       = ["arn:aws:sns:us-east-1:723008196684:notify-DBA-Pager",var.notification[0]]
  ok_actions          = [var.notification[1]]
  dimensions = {
    DBInstanceIdentifier = element(var.DBInstanceIdentifier, count.index)
}
}

#This function is to create the alert for BurstBalance
resource "aws_cloudwatch_metric_alarm" "Burst_Balance_Alarm" {              
  count = local.burst_balance_present ? length(var.DBInstanceIdentifier) : 0
  alarm_name          = "testing_Critical | AWS INF | RDS |  ${element(var.DBInstanceIdentifier, count.index)} | BurstBalance breached Lower Threshold"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "BurstBalance"
  namespace           = "AWS/RDS"
  period              = 60
  statistic           = "Average"
  threshold           = var.metrics["burst_balance"]
  alarm_actions       = ["arn:aws:sns:us-east-1:723008196684:notify-DBA-Pager",var.notification[0]]
  ok_actions          = [var.notification[1]]
  dimensions = {
    DBInstanceIdentifier = element(var.DBInstanceIdentifier, count.index)
}
}

#This function is to create the alert for DatabaseConnections
resource "aws_cloudwatch_metric_alarm" "Database_Connections_Alarm" {              
  count = local.database_connnection_present ? length(var.DBInstanceIdentifier) : 0
  alarm_name          = "Critical | AWS INF | RDS |  ${element(var.DBInstanceIdentifier, count.index)} | DatabaseConnections breached Upper Threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = var.metrics["database_connnections"]
  alarm_actions       = ["arn:aws:sns:us-east-1:723008196684:notify-DBA-Pager",var.notification[0]]
  ok_actions          = [var.notification[1]]
  dimensions = {
    DBInstanceIdentifier = element(var.DBInstanceIdentifier, count.index)
}
}

#This function is to create the alert for SwapUsage
resource "aws_cloudwatch_metric_alarm" "Swap_Usage_Alarm" {              
  count = local.swap_usage_present ? length(var.DBInstanceIdentifier) : 0
  alarm_name          = "Critical | AWS INF | RDS |  ${element(var.DBInstanceIdentifier, count.index)} | SwapUsage breached Upper Threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "SwapUsage"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = var.metrics["swap_usage"]
  alarm_actions       = ["arn:aws:sns:us-east-1:723008196684:notify-DBA-Pager",var.notification[0]]
  ok_actions          = [var.notification[1]]
  dimensions = {
    DBInstanceIdentifier = element(var.DBInstanceIdentifier, count.index)
}
}


/* <code need to be commanded>  */                           #Use this notation for non executing the group of line 
