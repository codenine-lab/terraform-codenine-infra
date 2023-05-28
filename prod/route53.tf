resource "aws_route53_zone" "route53_host_zone" {
    name = var.domain_name
    comment = "domain name"
}

resource "aws_route53_record" "route53_record_a_eb" {
    zone_id = aws_route53_zone.route53_host_zone.zone_id
    name    = "api.${var.domain_name}"
    type    = "A"
    
    alias {
        name = "${aws_elastic_beanstalk_environment.beanstalkappenv.cname}"
        zone_id = "Z3JE5OI70TWKCP"
        evaluate_target_health = true
    }
}

output "nameservers" {
    value = aws_route53_zone.route53_host_zone.name_servers
}
