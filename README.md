# Terraform Azure Infrastruktur – Web + Database

Dette prosjektet oppretter en fullstendig infrastruktur i Azure med Terraform:

## Infrastruktur

- 1 Resource Group
- 1 Virtual Network med to subnets (web & db)
- 2 NSG-er (web og database)
- 1 Webserver (Ubuntu VM + NGINX)
- 2 Database-VM-er med MySQL
- Intern Load Balancer foran databasen
- Webserver med offentlig IP og åpen port 80
- SSH-tilgang via port 22

## Bruk

1. **Installer Terraform & Azure CLI**
2. Kjør `az login`
3. Lag `terraform.tfvars` med:

```hcl
project_name = "studentproj"
resource_group_name = "terraform-demo-rg"
resource_group_location = "westeurope"
admin_username = "azureuser"
admin_password = "MySecurePass#123"

Initier prosjektet:
 terraform init

Kjør plan og apply:
 terraform plan
 terraform apply

Besøk nettsiden:
 http://<output from terraform>: web_public_ip

SSH til VM
 ssh azureuser@<web_public_ip>

# terraform-azure-project/            # Rot for Terraform-prosjektet
# ├── README.md                       # Dokumentasjon for prosjektet
# ├── main.tf                         # Hoved Terraform-konfigurasjon som kaller modulene
# ├── variables.tf                    # Globale input-variabler for prosjektet
# ├── outputs.tf                      # Outputs fra hovedkonfigurasjonen
# ├── terraform.tfvars                # Variabelverdier
# ├── modules/                        # Mappen som inneholder alle Terraform-moduler
# │   ├── network/                    # Modul for nettverksinfrastruktur
# │   │   ├── main.tf                 # Ressursdefinisjoner for nettverk
# │   │   ├── variables.tf            # Input-variabler for nettverksmodulen
# │   │   ├── outputs.tf              # Outputs fra nettverksmodulen
# │   │   └── locals.tf               # Lokale variabler for interne verdier i modulen
# │   ├── vm/                         # Modul for virtuelle maskiner
# │   │   ├── main.tf                 # Ressursdefinisjoner for VM
# │   │   ├── variables.tf            # Input-variabler for VM-modulen
# │   │   ├── outputs.tf              # Outputs fra VM-modulen
# │   │   └── locals.tf               # Lokale variabler for VM-modulen
# │   └── loadbalancer/               # Modul for lastbalanserer
# │       ├── main.tf                 # Ressursdefinisjoner for Load Balancer
# │       ├── variables.tf            # Input-variabler for LB-modulen
# │       ├── outputs.tf              # Outputs fra LB-modulen 
# │       └── locals.tf               # Lokale variabler for LB-modulen
# └── .github/
#    └── workflows/
#        └── terraform.yml           # GitHub Actions workflow for automatisk deploy