echo "Clean previous build"
jekyll clean
echo "Building blog"
jekyll build
echo "Deploying blog to s3"
AWS_PROFILE=timjkstrickland aws s3 sync _site s3://timjkstrickland.com
echo "Invalidate cache"
AWS_PROFILE=timjkstrickland aws cloudfront create-invalidation --distribution-id E1AF4LAW02CDTE --paths "/*"
