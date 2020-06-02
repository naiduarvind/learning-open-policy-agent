package main

deny[msg] {
    app := input.backend
    not app.port = "443"
    msg := "Default backend port for any service should be 443"
}