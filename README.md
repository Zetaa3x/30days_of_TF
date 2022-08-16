## 30 days of Terraform (Road to Terraform Associate)

Day One:
Back to square one of learning Terraform. I used TF before with AWS and did a few youtube tutorials but I don't think I actually learned TF's fundamentals. For the first day I went through the [short hashicorp TF tutorial](https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code?) except the storing state section then did research on some subreddits and on the Terraform Associate certificate.

#### Quick start tutorial(Install Terraform section) 

The code they provided deploys a docker container with the latest image of a nginx web server. I've installed nginx before on linux systems before and I've also used docker before but creating the Makefile with the docker commands was a good refresher. The `terraform apply` was successful, but it gave a warning that the .latest attribute was depreciated. 

> 		Warning: Deprecated attribute
> 		   on main.tf line 18, in resource "docker_container" "nginx":
> 		   18: 	image = docker_image.nginx.latest
> 		 The attribute "latest" is deprecated. Refer to the provider documentation for
> 		 details.
> 		(and one more similar warning elsewhere)```
>

#### Build Infrastructure 

This part of the section the code they provided uses AWS and its CLI to deploy a EC2 instance. For this part I had to install the AWS CLI and use IAM to create a user with API keys in order create a credentials file with the `aws configure` command. At first I thought the deploy would be successful until I ran into an unauthorization error. Then I remembered that I had to attach EC2 privileges to the user we just created.

> ```	  
> Error: creating EC2 Instance: UnauthorizedOperation: You are not authorized to perform this operation. Encoded authorization failure message: 
> status code: 403
> ```

Day Two:

I decided to start working in different branches and then merging with master when I am satisfied with my work. I've never been comfortable with branches but since I did some GitLab stuff I think I can understand it enough to work with it. 