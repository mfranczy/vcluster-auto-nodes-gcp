##########
# CCM 
#########

module "kubernetes_apply" {
  source        = "./apply"

  manifest_file = "${path.module}/ccm.yaml.tftpl"
  template_vars = {
    cluster_name = local.vcluster_name
    image        = "docker.io/mfranczy/cloud-controller-manager:v34.0.0"
  }
}

##########
# CSI
##########

