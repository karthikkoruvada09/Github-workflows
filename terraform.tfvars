profile = "988478710043"
env     = "stage"

app_port                     = "8080" # this must match the one exposed in the Dockerfile
app_log_retention_days       = 3
app_enable_rate_limiter_ip   = true
app_enable_newrelic          = true
app_newrelic_account_id      = "2364731"
app_newrelic_app_name        = "dazn-performance-test"
app_enable_geofencing        = false
app_enable_hmac_debug        = false
app_activated_pin_lifetime   = 60 * 60 * 1000 // 1 hour
app_unactivated_pin_lifetime = 60 * 60 * 1000 // 1 hour

log_levels = {
  app   = "info"
  apigw = "INFO"
}

ecs = {
  autoscaling_enabled        = true
  service_desired_task_count = "0"
  max_tasks                  = "0"
  cpu                        = 512
  memory                     = 512
  ulimit_soft                = 2048
  ulimit_hard                = 2048
}

encrypted_secrets = {
  newrelic_license_key = "AQICAHjnn030PUy7rO8iE3Mk+q9BOP1FX17LPb9lSg6Uz4pOJwESgYOqe0OHowfKnYolrfp1AAAAhzCBhAYJKoZIhvcNAQcGoHcwdQIBADBwBgkqhkiG9w0BBwEwHgYJYIZIAWUDBAEuMBEEDFz87tVSO31SAxSO+AIBEIBDab4FHqZGBO0C1xGlDeQxlNUpqxDzWf/TJn5zfRG+OOJ183oWUbxeviGb30wZh54X/skOmIDQK01pDTTHeIJ4wn1xZw=="
  newrelic_api_key     = "AQICAHjnn030PUy7rO8iE3Mk+q9BOP1FX17LPb9lSg6Uz4pOJwFKekS79HZlVYqInG0T16XiAAAAfjB8BgkqhkiG9w0BBwagbzBtAgEAMGgGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQM84+DmZKBjAn2XXS3AgEQgDtne53lcEy+eq0KwvBQh909tkYoUy5rIFcysQXT7HMBUKMY7AngnDAymF/iQ2G7CBzEARQYJCJ6Y/6YcQ=="
}
