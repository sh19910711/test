create_collection() {
  aws rekognition --region us-east-1 create-collection --collection-id animals
  aws rekognition --region us-east-1 list-collections
}

index_faces() {
  for obj in $(aws s3 ls s3://analyticsjam/AI02/ | awk '{print $4}'); do
    aws rekognition --region us-east-1 index-faces \
      --image '{"S3Object":{"Bucket":"analyticsjam","Name":"AI02/'$obj'"}}' \
      --collection-id animals \
      --external-image-id $obj
  done
}

sudo pip install var_dump
cat <<PYTHON | python
import boto3
from var_dump import var_dump
from collections import Counter

def detect_labels(key):
  rekognition = boto3.client("rekognition", "us-east-1")

  response = rekognition.detect_labels(
    Image={
      "S3Object": {
        "Bucket": "analyticsjam",
        "Name": key,
      }
    },
    MaxLabels=10,
    MinConfidence=90
  )
  var_dump(response['Labels'])
  return [l['Name'] for l in response['Labels']]

def get_s3_keys():
  s3 = boto3.client("s3", "us-east-1")
  objs = s3.list_objects(
    Bucket='analyticsjam',
    Prefix='AI02/'
  )
  return [obj['Key'] for obj in objs['Contents']]

c = Counter()
for k in get_s3_keys():
  print(k)
  print("\n")
  c += Counter(detect_labels(k))
print(c)
PYTHON
