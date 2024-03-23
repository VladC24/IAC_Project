variable "name" {
    description = "The name of the database"
    type        = string
}

variable "username" {
    description = "The username for the database"
    type        = string
}

variable "password" {
    description = "The password for the database"
    type        = string
}

variable "db_instance_type" {
    description = "The instance type for the RDS instance"
    type        = string
}

variable "db_allocated_storage" {
    description = "The allocated storage for the RDS instance"
    type        = number
}

variable "db_engine" {
    description = "The database engine for the RDS instance"
    type        = string
}

variable "db_engine_version" {
    description = "The version of the database engine"
    type        = string
}

variable "db_subnet_group_name" {
    description = "The name of the DB subnet group"
    type        = string
}

variable "maintenance_window" {
    description = "The maintenance window for the RDS instance"
    type        = string
}

variable "identifier" {
    description = "The identifier for the RDS instance"
    type        = string
}

variable "port" {
    description = "The port for the RDS instance"
    type        = number
}

variable "skip_final_snapshot" {}

variable "backup_window" {
    description = "The backup window for the RDS instance"
    type        = string
}

variable "db_subnet_ids" {
    description = "The subnet IDs for the RDS instance"
    type        = list(string)
}

variable "db_security_group_id" {
    description = "The security group ID for the RDS instance"
    type        = string
}