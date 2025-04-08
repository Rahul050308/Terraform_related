module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "~> 20.31.0"

    cluster_name = local.name
    cluster_version = "1.27" # Downgraded to a supported version
    cluster_endpoint_public_access = true

    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets
    control_plane_subnet_ids = module.vpc.intra_subnets

cluster_addons = {
    coredns = {
        most-recent = true
    }
    kube-proxy = {
        most-recent = true
    }
    vpc-cni = {
        most-recent = true
    }
}

    eks_managed_node_group_defaults = {
        instance_type = "t2.medium"
        attach_cluster_primary_security_group = true
    }

    eks_managed_node_groups = {
        rhs-cluster-ng = {
            desired_size = 2
            max_size = 3
            min_size = 2
            instance_type = "t2.medium"
            capacity_type = "SPOT"
        }
    }

    tags = {
        Terraform = "true"
        Environment = local.env
    }
}