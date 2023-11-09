resource "aws_route53_zone" "route53_host_zone" {
    name = var.domain_name
}

resource "aws_route53_record" "mx_record" {
  zone_id = aws_route53_zone.route53_host_zone.zone_id

  name    = var.domain_name
  type    = "MX"
  ttl     = 300 

  records = [
    "10 ASPMX.daum.net",
    "20 ALT.ASPMX.daum.net",
    "30 inbound-smtp.us-east-1.amazonaws.com",
    "40 inbound-smtp.eu-west-1.amazonaws.com",
    "50 inbound-smtp.us-west-2.amazonaws.com",
  ]
}

resource "aws_route53_record" "ns_record" {
  allow_overwrite = true
  name            = var.domain_name
  ttl             = 172800
  type            = "NS"
  zone_id         = aws_route53_zone.route53_host_zone.zone_id

  records = [
    aws_route53_zone.route53_host_zone.name_servers[0],
    aws_route53_zone.route53_host_zone.name_servers[1],
    aws_route53_zone.route53_host_zone.name_servers[2],
    aws_route53_zone.route53_host_zone.name_servers[3],
  ]
}

output "ns_records" {
  value = aws_route53_record.ns_record.records
}