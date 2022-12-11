startdir=$PWD

rm -rf ./content
rm -rf ./static/img

cd ../tweetback
npm run build

cp -r ./_site/. ../twitterarchive.gaunt.dev/content

cd $startdir
mv ./content/index.html ./content/_index.html
rm -rf ./content/assets
rm ./content/404.html
mv ./content/img ./static/
