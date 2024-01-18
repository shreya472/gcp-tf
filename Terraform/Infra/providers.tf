terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.11.0"
    }
  }
}

provider "google" {
  project     = "calcium-channel-411404"
  region      = "asia-south1"
  zone        = "asia-south1-a"
  credentials = "keys.json"
}
