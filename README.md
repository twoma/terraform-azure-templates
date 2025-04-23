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