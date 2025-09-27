##########
# CCM 
#########

module "kubernetes_apply" {
  source        = "./apply"

  manifest_file = "${path.module}/manifests/ccm.yaml.tftpl"
  template_vars = {
    network_name  = local.network_name
    subnet_name   = local.subnet_name
    vcluster_name = local.vcluster_name
    image         = "docker.io/mfranczy/cloud-controller-manager:v34.0.0"
  }
}

##########
# CSI
##########

