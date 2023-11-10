data "aws_route53_zone" "route53_host_zone" {
    name = var.domain_name
}

resource "aws_route53_record" "route53_record_a_eb" {
    zone_id = data.aws_route53_zone.route53_host_zone.zone_id
    name    = var.sub_domain_name
    type    = "A"
    
    alias {
        name = aws_elastic_beanstalk_environment.eb_env.cname
        zone_id = "Z3JE5OI70TWKCP"
        evaluate_target_health = true
    }
}

output "nameservers" {
    value = data.aws_route53_zone.route53_host_zone.name_servers
}
