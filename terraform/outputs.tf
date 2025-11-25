output "ami_used" {
  value = aws_instance.os_based_instance.ami
}

output "instance_id" {
  value = aws_instance.os_based_instance.id
}

output "os_type" {
  value = var.os_type
}

output "private_ip" {
  value = aws_instance.os_based_instance.private_ip
}

output "subnet_id" {
  value = var.subnet_id
}

output "vpc_security_group_ids" {
  value = aws_instance.os_based_instance.vpc_security_group_ids
}

output "instance_name" {
  value = local.effective_instance_name
}
output "region" {
  value = var.region
}

# Raw tags provided from the UI
output "tags" {
  value       = var.tags
  description = "Tags provided via UI"
}

# Effective tags that were applied to the instance (UI tags + Name tag)
output "applied_tags" {
  value = merge(
    var.tags,
    {
      # Keep this logic in sync with your resource tag composition
      Name = var.instance_name != "" ? var.instance_name : "dynamic-os-instance"
    }
  )
  description = "Effective tags applied (merged with Name)"
}

