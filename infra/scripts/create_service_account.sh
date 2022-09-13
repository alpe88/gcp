#service account name: sa-[env]-tf-[project name]

#gcloud iam service-accounts create [service account name] \
#–description=”Terraform Service account Demo Sandbox Environment”
#\
#–display-name=”Terraform Service Account”

gcloud iam service-accounts create sa-dev-tf-test-project \
–description=”Terraform Service account Dev Test Project Environment”
\
–display-name=”Terraform Service Account”