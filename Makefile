IMAGE_TAG=${CIRCLE_SHA1}

setup_gcloud:
	./setupGcloud

build:
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

test:
	echo "There are no tests! gl.."

push_image:
	./pushImage

deploy:
	./deploy

