.PHONY: build clean deploy

run:
	dart run bin/server.dart

deploy:
	make image && make gcp-build && make gcp-deploy	

image:
	docker build -t dartup-conf-2021 .

gcp-build:
	gcloud builds submit --tag gcr.io/fir-signin-4477d/dartup-conf-2021		

gcp-deploy:
	gcloud run deploy dartup-conf-2021 --image gcr.io/fir-signin-4477d/dartup-conf-2021 --max-instances=1 --region=us-central1 --allow-unauthenticated

test-image:
	docker run --rm -it -p 8080:8080 dartup-conf-2021:latest

images:
	docker images	

containers:
	docker ps

gcp-project:
	gcloud config get-value project

