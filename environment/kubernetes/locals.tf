locals {
  vcluster_name = nonsensitive(var.vcluster.instance.metadata.name)
}
