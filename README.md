# Terraform Azure Infrastruktur – Web & Database

Dette prosjektet oppretter en komplett infrastruktur i Azure ved hjelp av Terraform.

## 📦 Infrastrukturkomponenter

- 1 Resource Group
- 1 Virtual Network med to subnets (web og database)
- 2 Network Security Groups (NSG) – én for web og én for database
- 1 Webserver (Ubuntu VM med NGINX)
- 2 Database-VM-er (MySQL)
- Intern Load Balancer foran databasen
- Webserver med offentlig IP og åpen port 80
- SSH-tilgang via port 22

## 🚀 Kom i gang

1. **Installer nødvendige verktøy:**
   - Terraform
   - Azure CLI

2. **Logg inn i Azure:**
   ```bash
   az login
   ```

3. **Opprett `terraform.tfvars` med følgende innhold:**

   ```hcl
   project_name          = "studentproj"
   resource_group_name   = "terraform-demo-rg"
   resource_group_location = "westeurope"
   admin_username        = "azureuser"
   admin_password        = "MySecurePass#123"
   ```

4. **Initialiser og kjør Terraform:**

   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

5. **Besøk nettsiden:**
   ```text
   http://<web_public_ip>
   ```

6. **SSH til webserveren:**
   ```bash
   ssh azureuser@<web_public_ip>
   ```

## 🗂️ Mappestruktur

```
terraform-azure-project/
├── README.md                   # Dokumentasjon for prosjektet
├── main.tf                     # Hovedkonfigurasjon som kaller modulene
├── variables.tf                # Globale input-variabler
├── outputs.tf                  # Outputs fra hovedkonfigurasjonen
├── terraform.tfvars            # Verdier for variabler
├── modules/                    # Mappe for Terraform-moduler
│   ├── network/                # Nettverksinfrastruktur
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── locals.tf
│   ├── vm/                     # Virtuelle maskiner
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── locals.tf
│   └── loadbalancer/           # Lastbalanserer
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── locals.tf
└── .github/
    └── workflows/
        └── terraform.yml       # GitHub Actions workflow for automatisk deploy
```