#!/bin/bash

export PYTHONIOENCODING=UTF-8
UA=`faker user_agent`
#PWD=`pwd`
YEAR=`shuf -i 1972-1992 -n 1`
MONTH=`shuf -i 1-9 -n 1`
DATE=`shuf -i 10-28 -n 1`

#curl -L  -s   -X $'GET' \
#    -H $'Host: latestcasinobonuses.com' -H "User-Agent: $UA" -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H $'Accept-Language: en,en-US;q=0.5' -H $'Accept-Encoding: gzip, deflate' -H $'Upgrade-Insecure-Requests: 1' -H $'Connection: close' -c $PWD/cookie  \    $'https://latestcasinobonuses.com/url?casino=1087'

#html2dic cookie > bet
#TOKEN=`sed -n '47p' bet`


curl 'https://www.betjoycasino.com/billfold-api/player/registerPlayer' -H 'Cookie: _lang=en; _ga=GA1.2.735991672.1518661253; _gid=GA1.2.1440066494.1518661253; affiliate_id=14; devicefingerprint=40406310a5d39a81a5eed62ed6e272a7; LPVID=hjOGIxZDRlYjgwZDJiMDc0; LPSID-7496393=uU2QFQQGRRmyagRuGyAe8A; affiliate_token=KhIM0mAhvu22Af36STqbR2Nd7ZgqdRLk; referer="promotions&_=1518662515400"; JSESSIONID=85A789C5DF83458747E9C8DAA968682F' -H 'Origin: https://www.betjoycasino.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en,en-US;q=0.9,ja;q=0.8,zh-CN;q=0.7,zh;q=0.6' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://www.betjoycasino.com/?token=KhIM0mAhvu22Af36STqbR2Nd7ZgqdRLk&user_id=14' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' -H 'DNT: 1' --data "email=$1&password=Hh1234&country=$3&registrationCurrency=EUR&confirmEmail=$1&confirmPassword=Hh1234&nickName=$2&day-birthDate=$DATE&month-birthDate=$MONTH&year-birthDate=$YEAR&ageChecked=1&policyChecked=1&receiveEmail=1&publicPerson=0&campaignId=7353&device=$RANDOM$RANDOM&timezone=480" --compressed

echo $1 $DATE-$MONTH-$YEAR >> betcc.txt



echo $3 >> betcc.txt
