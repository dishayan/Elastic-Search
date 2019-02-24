# YAML format code: - elasticsearch.yml
# JSON format code: - elasticsearch.template

Above code is to create 3 node Elasticsearch cluster on AWS

Step -1: Make sure you have uploaded the template file in S3.

         example, i placed the teplate file on "https://s3.amazonaws.com/deba-bkt/deb_final_ES.template"
         
Step -2: Make sure boto3 and botcore python modules are installed on your system.

Step -3: setup aws credentials using "aws configure" or you can put a varibale file on your home directory.

Step -4: Run the ansible playbook.

         # ansible-playbook ansible-aws-es.yml
         
Step -5: It will take 10 min to up the ElasticSearch which you can confirm on aws console. To confirm its running, you need to check the status should be"green".
