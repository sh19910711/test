export AWS_REGION=us-east-1

create_collection() {
  aws rekognition create-collection --region us-east-1 --collection-id animals
  aws rekognition list-collections
}
