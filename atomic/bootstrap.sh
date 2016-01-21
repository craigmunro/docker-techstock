#!/bin/bash

test ! -d /etc/pki/kube-apiserver && mkdir /etc/pki/kube-apiserver 
test ! -e /etc/pki/kube-apiserver/serviceaccount.key && openssl genrsa -out /etc/pki/kube-apiserver/serviceaccount.key 2048
sed -i '/KUBE_API_ARGS=*/c\KUBE_API_ARGS="--service_account_key_file=/etc/pki/kube-apiserver/serviceaccount.key"' /etc/kubernetes/apiserver
sed -i '/KUBE_CONTROLLER_MANAGER_ARGS=*/c\KUBE_CONTROLLER_MANAGER_ARGS="--service_account_private_key_file=/etc/pki/kube-apiserver/serviceaccount.key"' /etc/kubernetes/controller-manager

for SERVICE in etcd kube-apiserver kube-controller-manager kube-scheduler kube-proxy kubelet; do 
        systemctl enable $SERVICE
        systemctl start $SERVICE
done
