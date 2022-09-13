#service account name: sa-[env]-tf-[project name]

#gcloud iam service-accounts get-iam-policy [service account name]@PROJECT_ID.iam.gserviceaccount.com \–format=json > policy.json

gcloud projects add-iam-policy-binding test-project-362121 \
–member=”serviceAccount:sa-dev-tf-test-project-@test-project-362121.iam.gserviceaccount.com” \
–role=”roles/editor”