# Managing Multiple Environments in Terraform

Managing multiple environments (`dev`, `staging`, `prod`) in Terraform is a common DevOps practice. There are several ways to achieve this efficiently:

---

## **1. Using Terraform Workspaces**
Terraform workspaces allow you to maintain multiple states within a single configuration.

### **Setup Workspaces**
```sh
terraform workspace new dev
terraform workspace new staging
terraform workspace new prod
```

### **Switch Between Workspaces**
```sh
terraform workspace select dev  # Switch to 'dev'
terraform apply                 # Apply configuration
```

### **Use Workspaces in Code**
Modify `terraform.tfvars` dynamically based on the workspace:
```hcl
variable "environment" {
  default = terraform.workspace
}
```

---

## **2. Directory Structure Approach**
Another way is to create separate directories for each environment.

```
terraform-project/
│── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   ├── staging/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   ├── prod/
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
```

### **Run Terraform for Specific Environment**
```sh
cd environments/dev
terraform init
terraform apply -var-file="terraform.tfvars"
```

---

## **3. Using Terraform Modules**
Modules allow reusable infrastructure for different environments.

### **Structure**
```
terraform-project/
│── modules/
│   ├── vpc/
│   ├── ecs/
│   ├── rds/
│── environments/
│   ├── dev/main.tf
│   ├── staging/main.tf
│   ├── prod/main.tf
```

### **Example `main.tf` for an Environment**
```hcl
module "vpc" {
  source      = "../modules/vpc"
  env         = "dev"
  cidr_block  = "10.0.1.0/24"
}
```

Apply it with:
```sh
terraform apply -var="env=dev"
```

---

## **4. Using Terraform Backend with Different State Files**
To separate state files per environment, configure the backend dynamically.

### **Example `backend.tf`**
```hcl
terraform {
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "env/${terraform.workspace}/terraform.tfstate"
    region = "us-east-1"
  }
}
```
Now each workspace (`dev`, `staging`, `prod`) will have its own Terraform state file.

---

## **Which Approach to Choose?**
| Approach                     | Best For |
|------------------------------|---------|
| Workspaces                   | Simple state separation but limited flexibility |
| Directory Structure           | Best for complex, environment-specific configurations |
| Modules                       | Reusability and maintainability across environments |
| Backend with State Separation | Centralized management with cloud storage |

## **License**
This project is open-source and available under the MIT License.

