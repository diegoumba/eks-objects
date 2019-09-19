module "eks_objects" {
  # source = "git::ssh://git@github.com/avaldigitallabs/devops-mod-aws-eks-objects.git?ref=INFRA-1584"
  source       = "../k8s/devops-mod-aws-eks-objects/"
}
