# Add the name record to the domain
resource "cloudflare_record" "subdomain_record" {
  zone_id = var.cloudflare_zone_id
  name    = "${var.name}"
  proxied = true
  value   = "${digitalocean_droplet.node.ipv4_address}"
  type    = "A"
  ttl     = 1
}
