#gcloud alpha storage buckets create gs://BUCKET_NAME --project=PROJECT_ID --default-storage-class=STORAGE_CLASS --location=BUCKET_LOCATION --uniform-bucket-level-access

#gcloud alpha storage buckets create gs://dev-tf-state --project=test-project-362121 --default-storage-class=STANDARD --location=US-CENTRAL1 --uniform-bucket-level-access

#source: https://cloud.google.com/architecture/managing-infrastructure-as-code

#create tf state bucket:
PROJECT_ID=$(gcloud config get-value project)
gsutil mb gs://${PROJECT_ID}-tfstate

#enable versioning:
gsutil versioning set on gs://${PROJECT_ID}-tfstate