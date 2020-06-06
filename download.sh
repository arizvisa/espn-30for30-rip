#!/bin/sh
# anti-mascot
base='https://hlsvod-l3c-clt1.media.plus.espn.com/ps01/espn/hls/2019/03/02/619ed9b0-cf45-4b43-8b2c-bac5756eb2e6/1551561066600'
# brave in the attempt
base='https://hlsvod-l3c-clt1.media.plus.espn.com/ps01/espn/hls/2018/12/10/6ae02e52-3be6-4037-beda-16b3a6efd484/1544422183458'
# delaney
base='https://hlsvod-l3c-clt1.media.plus.espn.com/ps01/espn/hls/2019/03/02/e9355e5b-7890-4b33-ad49-22a7cf111678/1551570486682'
# every day
base='https://hlsvod-l3c-clt1.media.plus.espn.com/ps01/espn/hls/2018/12/10/f7bec701-2b93-4fb7-88c7-c59c83394fcd/1544421955248'

name=$1
directory=`dirname "$2"`

mkdir -p "encrypted/$name.$directory"

curl -o "encrypted/$name.$2" "$base/$2" -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:65.0) Gecko/20100101 Firefox/65.0' -H 'Accept: */*' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://plus.espn.com/en/video?poster=http%3A%2F%2Fs.espncdn.com%2Fstitcher%2Fartwork%2Fcollections%2Fmedia%2F387ee595-deee-457f-9cc7-8b2118318b67%2F16x9.png%3FshowBadge%3Dtrue%26package%3DESPN_PLUS' -H 'Origin: https://plus.espn.com' -H 'DNT: 1' -H 'Connection: keep-alive'
