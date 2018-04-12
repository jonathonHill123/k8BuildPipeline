deploy:
	kubectl apply -f compose/stg/deployment.yml && \
	kubectl apply -f compose/stg/service.yml && \
	kubectl apply -f compose/stg/ingress.yml
