locals {
  network_name  = var.vcluster.nodeEnvironment.outputs.infrastructure["network_name"]
  subnet_name   = var.vcluster.nodeEnvironment.outputs.infrastructure["subnet_name"]
  vcluster_name = nonsensitive(var.vcluster.instance.metadata.name)
}
