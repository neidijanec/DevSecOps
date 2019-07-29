// Configurando a autenticacao no Google
provider "google" {
  credentials = "${file("key.json")}"
  project     = "my-project-id"
  region      = "us-central1"
}

resource "google_project" "my-project" {
  name = "DevSecOps"
  project_id = "my-project-id"
}

//Adicionando usuario para administrar instancias

data "google_iam_policy" "admin" {
  binding {
    role = "roles/compute.instanceAdmin"

    members = [
      "user:4linux@4linux.com.br",
    ]
  }
}


//criando a infraestrutura

resource "google_compute_instance" "webserver" {
name = "webserver-terraform"
machine_type = "n1-standard-1"
zone = "us-central1-a"

boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }


 network_interface {
    network = "default"

 access_config {
    }

  }
tags = ["http-server"]
metadata_startup_script = "apt-get update && apt-get install nginx -y && echo 'Sou DevOps' > /var/www/html/index.html"

}
