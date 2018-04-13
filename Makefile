IMAGE_TAG=${CIRCLE_SHA1}

setup_gcloud_stg:
	./setupGcloudStg

setup_gcloud_prod:
	./setupGcloudProd

build:
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

push_image:
	IMAGE_TAG=${IMAGE_TAG} ./pushImage

deploy_stg:
	./deploy-stg

deploy_prod:
	./deploy-prod
