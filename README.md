####CAPSTONE-2
####CLOUD INFRASTRUCTURE PROVISION & MONITOR

Capstone-2: EC2 instance Creation using Terraform on AWS using IAM Role | Terraform with AWS Cloud

Terraform is an open-source tool for provisioning and managing cloud infrastructure. Terraform can provision resources on any cloud platform. 
Terraform allows you to create infrastructure in configuration files (tf files) that describe the topology of cloud resources. These resources include virtual machines, storage accounts, networking interfaces, etc.


 

Pre-requisites:
•	Install Terraform on your EC2 instance.
You can provision resources in AWS cloud using Terraform by two ways as mentioned below:
1.	AWS Access keys + secret keys (un-secure way)
2.	IAM Role with AmazonEC2FullAccess Policy. (More secure way)
Option 2 is recommended approach as we already installed Terraform on EC2 instance that is inside AWS cloud. So, we do not need Access Keys + secret keys. But if you have installed Terraform on your local machine you would need to go with Option1.
    3. Cloud Watch for monitoring.

We will see how you can use Terraform to provision EC2 instance. Please do the below steps for provisioning EC2 instances on AWS.

Step - 1 Create an IAM role to provision EC2 instance in AWS 
Go to AWS console, click on IAM


 

Select AWS service, EC2, Click on Next Permissions

 
Type EC2 and choose AmazonEC2FullAccess as policy

 
Click on Next tags, Next Review
give some role name and click on Create role.

 



Step - 2 Assign IAM role to EC2 instance


Go back to Jenkins EC2 instance, click on EC2 instance, Security, Modify IAM role

 

Type your IAM role name my-ec2-terraform-role and save to attach that role to EC2 instance.

 

Login to EC2 instance where you have installed Terraform.

Step 3 - Create Terraform files

cd ~
mkdir project-terraform
cd project-terraform

Create Terraform Files
make sure you change what ever is high lighted in red color below per your settings.

sudo vi variables.tf



Now create main.tf file

sudo vi main.tf

Step 4 - Execute Terraform Commands

Now execute the below command:

terraform init

you should see like below screenshot.

 

Execute the below command

terraform plan

the above command will show how many resources will be added.
Plan: 3 to add, 0 to change, 0 to destroy.


Execute the below command

terraform apply

Plan: 3 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
Now login to EC2 console, to see the new instances up and running

List Resources created by Terraform
Execute the below command to view list of the resources created by Terraform.

terraform state list

The above command will list three resources created.

 

You should be able to see EC2 instance up and running in AWS console.


How to push Terraform files into GitHub

All Terraform files should be checked into version control systems such as GitHub. Let us see how to push code changes into GitHub. Make sure you are in the directory where Terraform files are created.

Create Remote repo in GitHub

Create a new repo with below name, make sure it is a private repo. Also do not click on initialize this repository with a README option.


Create Remote repo in GitHub:

Create a new repo with below name, make sure it is a private repo. Also do not click on initialize this repository with a README option.

  


Note:

If you have any issues in uploading tf files, you may not have created ssh-keys and uploaded into GitHub. Create ssh keys using ssh-keygen command:
ssh-keygen

This should generate both public and private keys.
Copy the public keys by executing the below command:

sudo cat ~/.ssh/id_rsa.pub

Initialize the directory first

git init

The above command will create local git repository.
Now add terraform files.

git add *.tf

git commit -m "Added terraform files"



Now push the code into GitHub

git push -u origin master

Now Login to GitHub to view the Terraform files

You may get this error if you have not uploaded ssh keys into GitHub.

 

So, make sure you upload SSH keys into your SCM.
By this time, we will be able to setup a Complete CI/CD Pipeline, Using Below Jenkinsfile:

 
 


GitHub URL:
https://github.com/Umamages/capstone2-terraform


