#!/bin/sh

# enhanced from https://medium.com/@damitj07/how-to-configure-and-use-aws-ecr-with-kubernetes-rancher2-0-6144c626d42c

set -eu

kube="kubectl -n $NS \
	--server https://${KUBERNETES_SERVICE_HOST}:${KUBERNETES_SERVICE_PORT} \
	--username ${KUBE_USER} \
	--password ${KUBE_PASS} \
	--insecure-skip-tls-verify=true"

export TOKEN=$(aws ecr get-login \
	--region ${REGION} \
	--registry-ids ${ACCOUNT} | cut -d' ' -f6)


# patch secret in place so we always have one ! 

$kube create secret docker-registry $SECRET_NAME \
	--docker-server=${DOCKER_SERVER} \
	--docker-username=AWS \
	--docker-password="${TOKEN}" \
	--docker-email="${EMAIL}" \
	-o yaml --dry-run | $kube apply -f -

$kube patch serviceaccount default \
	-p '{"imagePullSecrets":[{"name":"'$SECRET_NAME'"}]}'

echo "Updated $SECRET_NAME."