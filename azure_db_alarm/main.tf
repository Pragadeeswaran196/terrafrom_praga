/*
resource "azurerm_monitor_action_group" "main" {
  name                = "example-actiongroup"
  resource_group_name = "prod"
  short_name = "example"

  webhook_receiver {
    name        = "example"
    service_uri = "https://events.pagerduty.com/integration/7467daf5e2a84507d0dbcc80d05ea750/enqueue"
  }
}
*/

resource "azurerm_monitor_metric_alert" "cpu_alarm" {
    count = local.cpu_present ? length(var.db_name) : 0
  name                = "Critical | prod | Azure US | microsoft.dbforpostgresql-servers | ${element(var.db_name, count.index)} | ${var.env[1]} | Average cpu_percent GreaterThan Upper Threhold"
  resource_group_name = var.env[0]
  scopes              = ["/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourcegroups/prod/providers/microsoft.dbforpostgresql/servers/${element(var.db_name, count.index)}"]
  description         = "Action will be triggered when cpu_alarm is greater"
  frequency                = "PT1M"
  window_size              = "PT5M"
  severity                 = 0
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/servers"
    metric_name      = "cpu_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.metrics["cpu"]
  }
  action {
    action_group_id = "/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourceGroups/prod/providers/Microsoft.Insights/actionGroups/${var.notification}"
  }
  action{
    action_group_id = "/subscriptions/87A888F1-2E99-44D3-8A58-DC56744D321D/resourceGroups/fourkites-prod/providers/microsoft.insights/actionGroups/notify-dba"
  }
  tags = {
    terraform_managed = "True"
    env = var.env[0]
    team = var.env[1]
  }
}


resource "azurerm_monitor_metric_alert" "memory_alarm" {
    count = local.memory_present ? length(var.db_name) : 0
  name                = "Critical | prod | Azure US | microsoft.dbforpostgresql-servers | ${element(var.db_name, count.index)} | ${var.env[1]} | Average memory_percent GreaterThan Upper Threhold"
  resource_group_name = var.env[0]
  scopes              = ["/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourcegroups/prod/providers/microsoft.dbforpostgresql/servers/${element(var.db_name, count.index)}"]
  description         = "Action will be triggered when memory_alarm is greater"
  frequency                = "PT1M"
  window_size              = "PT5M"
  severity                 = 0
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/servers"
    metric_name      = "memory_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.metrics["memory"]
  }
  action {
    action_group_id = "/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourceGroups/prod/providers/Microsoft.Insights/actionGroups/${var.notification}"
    }
  action{
    action_group_id = "/subscriptions/87A888F1-2E99-44D3-8A58-DC56744D321D/resourceGroups/fourkites-prod/providers/microsoft.insights/actionGroups/notify-dba"
  }
  tags = {
    terraform_managed = "True"
    env = var.env[0]
    team = var.env[1]
  }
}


resource "azurerm_monitor_metric_alert" "storage_alarm" {
    count = local.storage_present ? length(var.db_name) : 0
  name                = "Critical | prod | Azure US | microsoft.dbforpostgresql-servers | ${element(var.db_name, count.index)} | ${var.env[1]} | Average storage_percent GreaterThan Upper Threhold"
  resource_group_name = var.env[0]
  scopes              = ["/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourcegroups/prod/providers/microsoft.dbforpostgresql/servers/${element(var.db_name, count.index)}"]
  description         = "Action will be triggered when storage_alarm is greater"
  frequency                = "PT1M"
  window_size              = "PT5M"
  severity                 = 0
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/servers"
    metric_name      = "storage_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.metrics["storage"]
  }
  action {
    action_group_id = "/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourceGroups/prod/providers/Microsoft.Insights/actionGroups/${var.notification}"
    }
  action{
    action_group_id = "/subscriptions/87A888F1-2E99-44D3-8A58-DC56744D321D/resourceGroups/fourkites-prod/providers/microsoft.insights/actionGroups/notify-dba"
  }
  tags = {
    terraform_managed = "True"
    env = var.env[0]
    team = var.env[1]
  }
}

resource "azurerm_monitor_metric_alert" "io_consumption_percent_alarm" {
    count = local.io_consumption_percent_present ? length(var.db_name) : 0
  name                = "Critical | prod | Azure US | microsoft.dbforpostgresql-servers | ${element(var.db_name, count.index)} | ${var.env[1]} | Average io_consumption_percent GreaterThan Upper Threhold"
  resource_group_name = var.env[0]
  scopes              = ["/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourcegroups/prod/providers/microsoft.dbforpostgresql/servers/${element(var.db_name, count.index)}"]
  description         = "Action will be triggered when io_consumption_present_alarm is greater."
  frequency                = "PT1M"
  window_size              = "PT5M"
  severity                 = 0
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/servers"
    metric_name      = "io_consumption_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.metrics["io_consumption_percent"]
  }
  action {
    action_group_id = "/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourceGroups/prod/providers/Microsoft.Insights/actionGroups/${var.notification}"
    }
  action{
    action_group_id = "/subscriptions/87A888F1-2E99-44D3-8A58-DC56744D321D/resourceGroups/fourkites-prod/providers/microsoft.insights/actionGroups/notify-dba"
  }
  tags = {
    terraform_managed = "True"
    env = var.env[0]
    team = var.env[1]
  }
}

resource "azurerm_monitor_metric_alert" "active_connections_alarm" {
    count = local.active_connections_present ? length(var.db_name) : 0
  name                = "Critical | prod | Azure US | microsoft.dbforpostgresql-servers | ${element(var.db_name, count.index)} | ${var.env[1]} | Average active_connections GreaterThan Upper Threhold"
  resource_group_name = var.env[0]
  scopes              = ["/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourcegroups/prod/providers/microsoft.dbforpostgresql/servers/${element(var.db_name, count.index)}"]
  description         = "Action will be triggered when active_connections_alarm is greater."
  frequency                = "PT1M"
  window_size              = "PT5M"
  severity                 = 0
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/servers"
    metric_name      = "active_connections"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.metrics["active_connections"]
  }
  action {
    action_group_id = "/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourceGroups/prod/providers/Microsoft.Insights/actionGroups/${var.notification}"
    }
  action{
    action_group_id = "/subscriptions/87A888F1-2E99-44D3-8A58-DC56744D321D/resourceGroups/fourkites-prod/providers/microsoft.insights/actionGroups/notify-dba"
  }
  tags = {
    terraform_managed = "True"
    env = var.env[0]
    team = var.env[1]
  }
}

resource "azurerm_monitor_metric_alert" "serverlog_storage_alarm" {
    count = local.serverlog_storage_precent_present ? length(var.db_name) : 0
  name                = "Critical | prod | Azure US | microsoft.dbforpostgresql-servers | ${element(var.db_name, count.index)} | ${var.env[1]} | Average serverlog_storage_percent GreaterThan Upper Threhold"
  resource_group_name = var.env[0]
  scopes              = ["/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourcegroups/prod/providers/microsoft.dbforpostgresql/servers/${element(var.db_name, count.index)}"]
  description         = "Action will be triggered when serverlog_storage_alarm is greater"
  frequency                = "PT1M"
  window_size              = "PT5M"
  severity                 = 0
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/servers"
    metric_name      = "serverlog_storage_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.metrics["serverlog_storage_percent"]
  }
  action {
    action_group_id = "/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourceGroups/prod/providers/Microsoft.Insights/actionGroups/${var.notification}"
    }
  action{
    action_group_id = "/subscriptions/87A888F1-2E99-44D3-8A58-DC56744D321D/resourceGroups/fourkites-prod/providers/microsoft.insights/actionGroups/notify-dba"
  }
  tags = {
    terraform_managed = "True"
    env = var.env[0]
    team = var.env[1]
  }
}

resource "azurerm_monitor_metric_alert" "connections_failed_alarm" {
    count = local.connections_failed_present ? length(var.db_name) : 0
  name                = "Critical | prod | Azure US | microsoft.dbforpostgresql-servers | ${element(var.db_name, count.index)} | ${var.env[1]} | Average connections_failed GreaterThan Upper Threhold"
  resource_group_name = var.env[0]
  scopes              = ["/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourcegroups/prod/providers/microsoft.dbforpostgresql/servers/${element(var.db_name, count.index)}"]
  description         = "Action will be triggered when connections_failed_alarm is greater"
  frequency                = "PT1M"
  window_size              = "PT5M"
  severity                 = 0
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/servers"
    metric_name      = "connections_failed"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = var.metrics["connections_failed"]
  }
  action {
    action_group_id = "/subscriptions/87a888f1-2e99-44d3-8a58-dc56744d321d/resourceGroups/prod/providers/Microsoft.Insights/actionGroups/${var.notification}"
    }
  action{
    action_group_id = "/subscriptions/87A888F1-2E99-44D3-8A58-DC56744D321D/resourceGroups/fourkites-prod/providers/microsoft.insights/actionGroups/notify-dba"
  }
  tags = {
    terraform_managed = "True"
    env = var.env[0]
    team = var.env[1]
  }
}
