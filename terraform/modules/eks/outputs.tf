output "endpoint" {
  value = aws_eks_cluster.iacproject.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.iacproject.certificate_authority[0].data
}
output "cluster_id" {
  value = aws_eks_cluster.iacproject.id
}
output "cluster_endpoint" {
  value = aws_eks_cluster.iacproject.endpoint
}
output "cluster_name" {
  value = aws_eks_cluster.iacproject.name
}