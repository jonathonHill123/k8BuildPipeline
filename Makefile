IMAGE_TAG=${CIRCLE_SHA1}

setup_gcloud:
	echo ${GCP_SERVICE_ACCOUNT_KEY} > /tmp/gcp-key.json && \
	gcloud auth activate-service-account --key-file /tmp/gcp-key.json && \
	gcloud --quiet config set project ${GOOGLE_PROJECT_ID} && \
	gcloud --quiet config set compute/zone ${GOOGLE_COMPUTE_ZONE} && \
	gcloud --quiet config set container/cluster ${GOOGLE_CLUSTER_NAME} && \
	gcloud --quiet container clusters get-credentials ${GOOGLE_CLUSTER_NAME}

build:
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG}

test:
	echo "There are no tests! gl.."

push:
	gcloud docker -- push $(eval echo ${IMAGE_NAME}:${IMAGE_TAG})

deploy:
	cat compose/stg/deployment.yml | sed "s~IMAGE_NAME_PLACEHOLDER~${IMAGE_NAME}~g" > tmp.txt && mv tmp.txt compose/stg/deployment.yml && \
	cat compose/stg/deployment.yml | sed "s~IMAGE_TAG_PLACEHOLDER~${IMAGE_TAG}~g" > tmp.txt && mv tmp.txt compose/stg/deployment.yml && \
	kubectl apply -f compose/stg/deployment.yml && \
	kubectl apply -f compose/stg/service.yml && \
	kubectl apply -f compose/stg/ingress.yml
