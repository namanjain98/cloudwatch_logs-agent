There are 8 files of terraform 
1) iam.tf is used to create iam policy for log-agent
2)main.tf  is used to launch the instance it has 
	security-group attachment
	instance-type
	attachment of iam-policy
	key-name
	and attachment of user-data
3)key.tf :- used to crete ssh keys for doing shh into instance
4)security-group.tf:- creating a security group and allowing port 20 and 80
5)outputs.tf: output the public ip address of the instance
6)vars.tf:- consisting the variables used in the code
7)provider.tf:- we have user provider as aws with ap-south-1 as region
8)cloudinit.tf :- It gives the path of user-data to be used

folder:
scripts:
	volumes.sh :- It consist the complete script of user-data


Commands to run:
terraform apply
for ssh in the instance:
	sudo chmod 600 mykey
	ssh -i mykey ec2-user@15.207.1.22(public ip address of the instance)

	