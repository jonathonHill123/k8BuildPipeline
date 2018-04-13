IMAGE_TAG=${CIRCLE_SHA1}

setup_gcloud_stg:
	./setupGcloudStg

setup_gcloud_prod:
	./setupGcloudProd

build:
	docker build -t ${IMAGE_NAME_STG}:${IMAGE_TAG} .

push_stg_image:
	IMAGE_TAG=${IMAGE_TAG} ./pushStgImage

push_prod_image:
	IMAGE_TAG=${IMAGE_TAG} ./renameStgImageToProdImage && \
	IMAGE_TAG=${IMAGE_TAG} ./pushProdImage

deploy_stg:
	IMAGE_TAG=${IMAGE_TAG} ./deploy-stg

deploy_prod:
	IMAGE_TAG=${IMAGE_TAG} ./deploy-prod
