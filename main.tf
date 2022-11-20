provider "google" {
  project = "oliver-company-iac"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yml")}"
}

resource "google_folder" "Financeiro" {
  display_name = "Financeiro"
  parent       = "organizations/85939644239"
}

resource "google_folder" "SalesForce" {
  display_name = "SalesForce"
  parent       = google_folder.Financeiro.name
}

resource "google_folder" "Producao" {
  display_name = "Desenvolvimento"
  parent       = google_folder.SalesForce.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Producao"
  parent       = google_folder.SalesForce.name
}


resource "google_project" "oliver-finan-sales-prod" {
  name       = "SalesForce-Dev"
  project_id = "oliver-finan-sales-prod"
  folder_id  = google_folder.Producao.name
  auto_create_network=false
  billing_account = "20C573-W4C80F-28P9S5"

}

provider "google" {
  project = "oliver-company-iac"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yml")}"
}

resource "google_folder" "Devops" {
  display_name = "Devops"
  parent       = "organizations/85939644239"
}

resource "google_folder" "Mobile" {
  display_name = "Mobile"
  parent       = google_folder.Devops.name
}

resource "google_project" "oliver-devops-mob-dev" {
  name       = "Devops"
  project_id = "oliver-devops-mob-dev"
  folder_id  = google_folder.Mobile.name
  auto_create_network=false
  billing_account = "20C573-W4C80F-28P9S5"
}

resource "google_folder" "HTML" {
  display_name = "HTML"
  parent       = google_folder.Devops.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.HTML.name
}


resource "google_project" "oliver-devops-dev-html" {
  name       = "Devops"
  project_id = "oliver-devops-dev-html"
  folder_id  = google_folder.Desenvolvimento.name
  auto_create_network=false
  billing_account = "20C573-W4C80F-28P9S5"

}

provider "google" {
  project = "oliver-company-iac"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yml")}"
}

resource "google_folder" "Marketing" {
  display_name = "Marketing"
  parent       = "organizations/85939644239"
}

resource "google_folder" "DesenvolvimentoMachineLearning" {
  display_name = "Desenvolvimento (Machine Learning)"
  parent       = google_folder.Marketing.name
}

resource "google_project" "oliver-dev-machine-learning-markt" {
  name       = "Devops"
  project_id = "oliver-dev-machine-learning-markt"
  folder_id  = google_folder.DesenvolvimentoMachineLearning.name
  auto_create_network=false
  billing_account = "20C573-W4C80F-28P9S5"
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.Marketing.name
}

resource "google_project" "oliver-prod-markt" {
  name       = "Producao"
  project_id = "oliver-prod-markt"
  folder_id  = google_folder.Producao.name
  auto_create_network=false
  billing_account = "20C573-W4C80F-28P9S5"

}