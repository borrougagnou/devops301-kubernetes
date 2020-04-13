#!/bin/bash

# GENERATE CERTIFICATE
# EDIT myuser VARIABLE

###VARIABLE
myuser=""
mycluster="minikube"
pathmyclusterca="$HOME/.minikube"

if [[ ! -f "$pathmyclusterca/ca.crt" || ! -f "$pathmyclusterca/ca.key" ]]; then
  echo "\"$pathmyclusterca\" doesn't exist or don't have ca file"
  exit 1
fi

echo "Nom d'utilisateur:"
read myuser

#CERTIFICAT CREATION
openssl genrsa -out $myuser.key 2048
openssl req -new -key $myuser.key -out $myuser.csr -subj "/CN=$myuser"
openssl x509 -req -in $myuser.csr -CA $pathmyclusterca/ca.crt  -CAkey $pathmyclusterca/ca.key -CAcreateserial -out $myuser-signed.crt -days 730

# KUBERNETES ADD
kubectl config set-credentials $myuser --client-certificate=.cert/$myuser-signed.crt --client-key=.cert/$myuser.key

kubectl config set-context usr-$myuser --cluster=$mycluster --user=$myuser

