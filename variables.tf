# elasticsearch datadog monitor vars

# if running in a pipeline pass the elasticsearch cluster_name to this module using the environment variable TF_VAR_cluster_name
variable cluster_name {
  default = "elasticsearch"
}

variable es_mon {
  description = "ES monitor properties"
  type = object({
    include_tags        = bool         # include additionl tag information in the subject of the alert
    locked              = bool         # allow changes outside of the pipleine and automation
    new_host_delay      = number       # delay monitoring for new resoruces for a period of time
    no_data_timeframe   = number       # timeframe to wait for new data before an alert triggers
    notify_audit        = bool         # notify when a monitor is changed
    notify_no_data      = bool         # notifies if there is no data for a monitored resource
    renotify_interval   = number       # time to wait to re-send alert
    require_full_window = bool         # require a full window of data before the monitor can trigger
    tags                = list(string) # list of tags
    thresholds_ok       = number       # threshold for OK
    thresholds_warning  = number       # threshold for WARNING
    thresholds_critical = number       # threshold for CRITICAL
    timeout_h           = number       # the number of hours of the monitor not reporting data before it will automatically resolve; 0 means never timeout
  })
  default = {
    include_tags        = false
    locked              = true
    new_host_delay      = 60
    no_data_timeframe   = 10
    notify_audit        = false
    notify_no_data      = true
    renotify_interval   = 30
    require_full_window = true
    tags                = ["managed-by:terraform", "team: kgs"]
    thresholds_ok       = 1
    thresholds_warning  = 1
    thresholds_critical = 1
    timeout_h           = 0
  }
}