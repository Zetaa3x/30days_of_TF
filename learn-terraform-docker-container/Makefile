# Can use the -auto-approve flag after the apply and destroy commands

run:
	terraform init
	terraform apply
	docker ps 
	curl localhost:8000

fmt:
	terraform fmt
	terraform validate

destroy:
	terraform destroy

clean:
	terraform destroy 
	rm -rf terraform.*
	rm -rf .terraform*

#Same thing as clean just not using terraform destroy 
#docker commands followed by '-' to ignore errors 
# Your user must be in the docker group to use this command

clean2:
	@echo "Stopping docker container..." 
	-docker ps 
	-docker stop tutorial
	@echo "Removing docker container..."
	-docker ps -a
	-docker rm tutorial
	rm -rf terraform.*
	rm -rf .terraform*

#Same thing as clean2 just for users who aren't in the docker group 
#but have sudo privileges.
clean3: 
	@echo "Stopping docker container..." 
	sudo docker ps 
	sudo docker stop tutorial
	@echo "Removing docker container..."
	sudo docker ps -a
	sudo docker rm tutorial
	rm -rf terraform.*
	rm -rf .terraform*