resource "aws_acm_certificate" "ddakzip_acm" {
    domain_name       = var.sub_domain_name
    validation_method = "DNS"
    validation_option {
        domain_name       = var.sub_domain_name
        validation_domain = var.domain_name
    }
    tags = {
        Environment = "test"
    }
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_route53_record" "route53_record_check_acm" {
    for_each = {
        for dvo in aws_acm_certificate.ddakzip_acm.domain_validation_options : dvo.domain_name => {
        name   = dvo.resource_record_name
        record = dvo.resource_record_value
        type   = dvo.resource_record_type
        }
    }
    allow_overwrite = true
    name            = each.value.name
    records         = [each.value.record]
    ttl             = 60
    type            = each.value.type
    zone_id         = data.aws_route53_zone.route53_host_zone.zone_id
}

# resource "aws_acm_certificate_validation" "acm_validation" {
#     provider                = aws.virginia
#     certificate_arn         = aws_acm_certificate.ddakzip_acm.arn
#     validation_record_fqdns = [for record in aws_route53_record.route53_record_check_acm : record.fqdn]
# }
