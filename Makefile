IMAGE_TAG=${CIRCLE_SHA1}

setup_gcloud:
	./setupGcloud

build:
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

push_image:
	IMAGE_TAG=${IMAGE_TAG} ./pushImage

deploy:
	./deploy
