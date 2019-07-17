#Config. VAULT EM PRODUÇÃO
storage "consul" {
  address = "127.0.0.1:8500"
  path    = "vault/"
}

listener "tcp" {
 address     = "192.168.77.30:8200"
 tls_disable = 1
}
