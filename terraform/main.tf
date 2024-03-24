module "eks" {
    source                    = "./modules/eks"
    aws_public_subnet         = module.vpc.aws_public_subnet
    vpc_id                    = module.vpc.vpc_id
    cluster_name              = "module-eks-${random_string.suffix.result}"
    endpoint_public_access    = true
    endpoint_private_access   = false
    public_access_cidrs       = ["0.0.0.0/0"]
    node_group_name           = "iacproject"
    scaling_desired_size      = 1
    scaling_max_size          = 1
    scaling_min_size          = 1
    instance_types             = ["t2.micro"]
    key_pair                  = "KeyPair"
    database_security_group_id = module.vpc.database_security_group_id
}

module "vpc" {
    source                   = "./modules/vpc"
    tags                     = "iacproject"
    instance_tenancy         = "default"
    vpc_cidr                 = "10.0.0.0/16"
    access_ip                = "0.0.0.0/0"
    public_sn_count          = 2
    public_cidrs             = ["10.0.2.0/24", "10.0.3.0/24"]
    private_sn_count         = 2
    private_cidrs            = ["10.0.5.0/24", "10.0.6.0/24"]
    map_public_ip_on_launch  = true 
    rt_route_cidr_block      = "0.0.0.0/0"
    app_security_group_cidr  = "10.0.0.0/16"
}

module "rds" {
    source               = "./modules/rds"
    identifier           = "iacproject"
    db_engine            = "mysql"
    db_engine_version    = "8.0.36"
    db_instance_type     = "db.t2.micro"
    db_allocated_storage = 1
    name                 = "iacproject_db"
    username             = ""
    password             = ""
    port                 = 3306
    skip_final_snapshot  = true
    db_security_group_id = module.vpc.database_security_group_id
    backup_window = "03:00-04:00"
    maintenance_window = "Mon:04:00-Mon:05:00"
    db_subnet_group_name = "iacproject-db-subnet-group"
    db_subnet_ids = [module.vpc.private_subnet_a, module.vpc.private_subnet_b]
}