build:
	docker-compose build

INFRA_BUILDPACK_RUN =	\
	make build && \
	docker-compose run --rm buildpack-infra

provision:
	$(INFRA_BUILDPACK_RUN) \
		"terraform apply \
		-var-file="vars/stg.tfvars""

destroy:
	$(INFRA_BUILDPACK_RUN) \
		"terraform destroy \
		-var-file="vars/stg.tfvars" -force"

shell:
	$(INFRA_BUILDPACK_RUN) "bash"
