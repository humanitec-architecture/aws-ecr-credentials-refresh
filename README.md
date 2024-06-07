# aws-ecr-credentials-refresh

A small image that periodically refreshes AWS ECR credentials.

Heavily inspired by <https://skryvets.com/blog/2021/03/15/kubernetes-pull-image-from-private-ecr-registry/>

## Usage

Run the image and open the printed URL in a browser to create GitHub App pre-configured for Backstage.

```bash
docker run --rm -it \
  -e AWS_REGION \
  -e AWS_ACCOUNT \
  -e NAMESPACE_NAME \
  -e DOCKER_SECRET_NAME \
  ghcr.io/humanitec-architecture/aws-ecr-credentials-refresh
```
