The Task :

Deploy a secure micro-service in GKE:

All infrastructure provisioning should be automated using terraform a. Local/remote terraform state can be used
Use custom VPC
GKE cluster should not be public [1]
Micro-Service should be deployed and managed using helm-charts
Micro-Service should be exposed via ingress (public / private)
Micro-service should be accessible using a DNS (http or https)
Add unit test cases for Terraform code using Terragrunt
Create an external data source (use Python script) to create below firewall rules with GKE provisioning: a. Allow egress from nodes to GKE master b. Allow all communication between nodes and pods
Setup health checks for micro-services
You can use sample application images available at [2] or create your own
Document caveats/limitations if any
Requirements (Good to Have)

• Securing micro-service using HTTPS • Using remote terraform state • Define restrictive network policies for micro-service namespace - default deny ingress and egress • Automated DNS records creation for the Service/Ingress • Automated Certificate provisioning for the Service/Ingress • Setup monitoring using stack driver • Istio setup
