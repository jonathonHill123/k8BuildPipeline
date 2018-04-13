IMAGE_TAG=${CIRCLE_SHA1}

setup_gcloud:
	./setupGcloud

build:
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

push_image:
	./pushImage

deploy:
	./deploy

