## v0.1.0 (2023-12-10)

### Feat

- **kubernetes_service**: update default node pool to two
- **main**: update args used for modules
- **container_registry**: change network rule set to allow
- **kubernetes_service**: assign various admin roles to aad client
- **container_registry**: perform role assignments to registry within module
- **main**: create service connections for azuredevops
- **development**: terragrunt init to pull providers used
- **kubernetes_service**: change identity to service principal
- **service_connections**: remove creation of aad application client
- **service_connections**: create service connections in azure devops
- **kubernetes_cluster**: add additional role assignments and expand on auth ip ranges
- **container_registry**: allow azure agent to push to registry
- **pre-commit**: add args for terraform-docs config
- **main**: create kubernetes cluster for fastapi
- **kubernetes_service**: apply aad role base access control
- **azurerm**: upgrade azurerm provider to newer version
- **kubernetes_service**: initial kubernetes service module
- **main**: create registry for pythonfastapi application
- **container_registry**: initial container registry module
- **development**: initial infrastructure set up
- **environments**: add `terragrunt.hcl` to each environment
- **.tflint**: add `.tflint.hcl` rules and also include `azurerm` plugin
- **terraform**: init terraform files for azurem provider
- **terraform**: init terraform and terragrunt configuration files
- **git**: init git configuration for project

### Refactor

- **main**: add description to aad application created and new outputs
- **service_connection**: remove role assignments in module
- **container_registry**: fix typo in variable description
- **gitignore**: add log files to ignore
