output "alb_dns_name" {
  description = "アプリケーションロードバランサーのDNS名"
  value       = module.alb.alb_dns_name
}
