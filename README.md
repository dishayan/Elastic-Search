# [ Duration of the lab - 1.5 hrours ]

YAML format code: - elasticsearch.yml which will be used by ansible playbook

JSON format code: - elasticsearch.template which will be called above code to make cloudformation stack

Above code is to create 3 node Elasticsearch cluster on AWS

Step -1: Make sure you have uploaded the template file in S3.

         example, i placed the teplate file on "https://s3.amazonaws.com/deba-bkt/deb_final_ES.template"
         
Step -2: Make sure boto3 and botcore python modules are installed on your system.

Step -3: setup aws credentials using "aws configure" or you can put a varibale file on your home directory.

Step -4: Run the ansible playbook.

         # ansible-playbook ansible-aws-es.yml
         
Step -5: It will take 10 min to up the ElasticSearch which you can confirm on aws console. To confirm its running, you need to check the status should be"green".



# Some answers we are looking:
1. What did you choose to automate the provisioning and bootstrapping of the instance? Why? 2. How did you choose to secure ElasticSearch? Why?
         
         cloudformation, ansible-playbook with boto3 module
         
3. How would you monitor this instance? What metrics would you monitor?

         #Available disk space, I/O utilization,CPU usage,Network bytes sent/received, Number of HTTP connections currently open, Total number of HTTP connections opened over time and many more.
         
4. Could you extend your solution to launch a secure cluster of ElasticSearch nodes? What would need to change to support this use case?
         
         can also optionally enable TLS on the HTTP layer
         
5. Could you extend your solution to replace a running ElasticSearch instance with little or no downtime? How?
         
         It is quite possible to make schema/mapping changes with zero downtime
         
6. Was it a priority to make your code well structured, extensible, and reusable?
         
         Yes
         
7. What sacrifices did you make due to time?
         
         None
