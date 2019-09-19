provider "aws" {
  region = "us-east-2"
}

provider "kubernetes" {
  config_path            = ".kube/config"
  load_config_file       = "true"
  config_context         = "aws"
  config_context_cluster = "kubernetes"
}

provider "helm" {
  # Helm home please set HELM_HOME to absolute path
  #home = ".helm"
  init_helm_home = "true"

  # Tiller
  namespace                       = "kube-system"
  install_tiller                  = "false"
  #service_account                 = "tiller"
  #automount_service_account_token = "true"
  #tiller_image                    = "gcr.io/kubernetes-helm/tiller:v2.14.1"

  #override = "true"
  #max_history = "1000"
  #debug       = "false"

  kubernetes {
    config_path      = ".kube/config"
    load_config_file = "true"
    config_context   = "aws"
  }
}
