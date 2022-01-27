---
layout: post
title:  "30.6.21 Wednesday"
date:   2021-06-30
categories: [update, stream]
permalink: /posts/30-june-21-wednesday/
excerpt: S3_Website is dead. Long live s3_website
---

For the first few iterations of this blog I relied on what was a pretty good solution. It was an interesting CLI tool called [s3_website]() which did a pretty solid job of getting all your files in Jekyll wrapped up with a bow. When I restarted the blog earlier this week, I had tried to use the tool again, but it turns out that the project has been deprecated and I would have to start troubleshooting.

### Player AWS S3 has entered the game

Turns out the regular AWS CLI has made leaps and bounds since I last took a look at it, and it can more than handle the task natively. You just need the following few lines in a shell script and it builds the whole jekyll site and deploys the changes, no problem:

```shell
  echo "Clean previous build"
  jekyll clean
  echo "Building blog"
  jekyll build
  echo "Deploying blog to s3"
  aws s3 sync _site s3://<yourbucketname>
```