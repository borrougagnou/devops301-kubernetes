#!/bin/bash

# GENERATE CERTIFICATE
# EDIT myuser VARIABLE

###VARIABLE
myuser=""

echo "Nom d'utilisateur:"
read myuser

#CERTIFICAT CREATION
openssl genrsa -out $myuser.key 2048
openssl req -new -key $myuser.key -out $myuser.csr -subj "/CN=$myuser"
openssl x509 -req -in $myuser.csr -CA ~/.minikube/ca.crt  -CAkey ~/.minikube/ca.key -CAcreateserial -out $myuser-signed.crt -days 730

# KUBERNETES ADD
kubectl config set-credentials $myuser --client-certificate=.cert/$myuser-signed.crt --client-key=.cert/$myuser.key

kubectl config set-context usr-$myuser --cluster=minikube --user=$myuser

