#!/usr/bin/env bash

domain="$1"
cn="*.$domain"
cacn='caroot'
pass="pr0c@llc3rtp@ssw0rd"
dirname="$( cd "$(dirname "$0")" ; pwd -P )"
cd $dirname


createCAkeyAndCert () {
openssl genrsa -passout "pass:$pass" -des3 -out ca.key 4096 
openssl req -new -passin "pass:$pass" -x509 -days 3650 -key ca.key -out ca.crt -subj "/C=AZ/ST=Baku/L=Baku/CN=$cacn" 
}

createSrvKeyAndCSR () {
openssl genrsa -out $domain.key 4096 
openssl req -new -key $domain.key -out $domain.csr -subj "/C=AZ/ST=Baku/L=Baku/CN=$cn/" -reqexts SAN -config <(cat ./openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:$domain,DNS:*.$domain,DNS:www.$domain,DNS:*.propbx.loc,DNS:propbx.loc"))
}

signSrvCsrWithCaKey () {
openssl x509 -req -passin "pass:$pass" -in $domain.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out $domain.crt -days 3650 -extfile <(cat ./openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:$domain,DNS:*.$domain,DNS:www.$domain,DNS:*.propbx.loc,DNS:propbx.loc")) -extensions SAN 
}

createUnusedp12 () {
openssl pkcs12 -export -passout "pass:$pass" -in $domain.crt -inkey $domain.key -certfile ca.crt -name $cn -caname $cacn -out $domain.p12 
}

if [ ! -f ca.key -a ! -f ca.crt ]
then
  createCAkeyAndCert $pass
  echo -e "\n *** CA Certificate and Key files generated successfull*** \n"
fi

createSrvKeyAndCSR
signSrvCsrWithCaKey $pass
rm -rf /etc/freeswitch/tls/*
cat $domain.crt $domain.key > /etc/freeswitch/tls/wss.pem
cat $domain.crt $domain.key > /etc/freeswitch/tls/agent.pem
cat ca.crt  > /etc/freeswitch/tls/cafile.pem
mkdir certs && mv $domain.* ca.* ./certs/
rm -rf $domain.* ca.* >/dev/null
chown -R freeswitch:freeswitch /etc/freeswitch/tls/
