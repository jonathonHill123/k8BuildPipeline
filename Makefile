IMAGE_TAG=${CIRCLE_SHA1}

setup_gcloud_stg:
	./bin/setupGcloudStg

setup_gcloud_prod:
	./bin/setupGcloudProd

build:
	docker build -t ${IMAGE_NAME_STG}:${IMAGE_TAG} .

push_stg_image:
	IMAGE_TAG=${IMAGE_TAG} ./bin/pushStgImage

push_prod_image:
	IMAGE_TAG=${IMAGE_TAG} ./bin/renameStgImageToProdImage && \
	IMAGE_TAG=${IMAGE_TAG} ./bin/pushProdImage

deploy_stg:
	IMAGE_TAG=${IMAGE_TAG} ./bin/deploy-stg

deploy_prod:
	IMAGE_TAG=${IMAGE_TAG} ./bin/deploy-prod
