echo "Clean previous build"
jekyll clean
echo "Building blog"
jekyll build
echo "Deploying blog to s3"
aws s3 sync _site s3://timjkstrickland.com
echo "Invalidate cache"
aws cloudfront create-invalidation --distribution-id E1AF4LAW02CDTE --paths "/*"
