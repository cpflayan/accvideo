#!/bin/bash
export PYTHONIOENCODING=UTF-8
SEX=`cat $PWD/sex | sort -R | head -1`
COUNTRY=$1
FAKER=`cat $PWD/countrycode/$COUNTRY`
PWD=`pwd`
FIRSTNAME=`faker -l $FAKER first_name_$SEX`
MOBILE=`faker -l $FAKER msisdn`
UA=`cat $PWD/user-agent.txt | sort -R | head -1`$RANDOM
LASTNAME=`faker -l $FAKER last_name_$SEX`
CITY=`faker -l $FAKER city`
YEAR=`shuf -i 1972-1992 -n 1`
MONTH=`shuf -i 1-9 -n 1`
DATE=`shuf -i 10-28 -n 1`
ADDRESS=`faker -l $FAKER street_address`
ZIPCODE=`faker -l $FAKER postcode`
NOW=`date +%Y-%m-%d`
DOMAIN=`cat $PWD/tempmail/fmgdomain.txt | sort -R | head -1`
USERHEAD=`tr -dc "[:alpha:]" < /dev/urandom | head -c 4`
USERNAME=$FIRSTNAME`shuf -i 10-100 -n 1`$USERHEAD
EMAIL=$USERNAME@guerrillamailblock.com

guerrillamail setaddr $USERNAME


echo $UA > $PWD/ua

echo username=$USERNAME'&'email=$EMAIL'&'secemail=$EMAIL'&'password=$USERNAME'&'country=$COUNTRY'&'conditions=1'&'mobile=$MOBILE'&'country_prefix=1'&'email_code=1111 > $PWD/step1

curl  -s -k  -X $'POST' \
    -H "@$PWD/ua" -H $'Referer: https://www.videoslots.com/registration1/' -H $'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H $'X-Requested-With: XMLHttpRequest' \
    --data-binary "@$PWD/step1"  -c /tmp/cookie \
    $'https://www.videoslots.com/phive/modules/Micro/registration_new.php?step1=true&lang=en'

sleep 15

guerrillamail list > guerr.txt
html2dic guerr.txt > guerr2.txt
READ=`sed -n '2p' guerr2.txt`

guerrillamail get $READ > code.txt
html2dic code.txt > code2.txt
EMAILCODES=`sed -n '25p' code2.txt`

echo firstname=$FIRSTNAME'&'lastname=$LASTNAME'&'address=$ADDRESS'&'zipcode=$ZIPCODE'&'city=$CITY'&'newsletter=1'&'over18=1'&'bonus_code=CM45'&'sex=$SEX'&'preferred_lang=en'&'dob=$YEAR-0$MONTH-$DATE'&'birthyear=$YEAR'&'birthmonth=0$MONTH'&'birthdate=$DATE'&'email_code=$EMAILCODES'&'currency=GBP > $PWD/step2




curl -s -k  -X $'POST' \
    -H "@$PWD/ua" -H $'Referer: https://www.videoslots.com/en/registration2/' -H $'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H $'X-Requested-With: XMLHttpRequest' \
    -b /tmp/cookie -c /tmp/cookie \
    --data-binary "@$PWD/step2" \
    $'https://www.videoslots.com/phive/modules/Micro/registration_new.php?lang=en' 

curl  -s -k  -X $'POST' \
    -H $'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:55.0) Gecko/20100101 Firefox/55.0' -H $'Referer: https://www.videoslots.com/account/' -H $'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H $'X-Requested-With: XMLHttpRequest' \
    -b /tmp/cookie -c /tmp/cookie \
    --data-binary $'aid=323&action=use-trophy-award&lang=en' \
    $'https://www.videoslots.com/phive/modules/Micro/ajax.php'

curl  -s -k  -X $'POST' \
    -H $'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:55.0) Gecko/20100101 Firefox/55.0'  -H $'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H $'X-Requested-With: XMLHttpRequest' \
     -b /tmp/cookie -c /tmp/cookie \
    --data-binary $'aid=324&action=use-trophy-award&lang=en' \
    $'https://www.videoslots.com/phive/modules/Micro/ajax.php'


#curl -L  'https://www.videoslots.com/phive/modules/Micro/play.php?5a212c5855ad0&game_id=bsgRooksRevenge&lang=en' -H 'Host: www.videoslots.com' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: zh-TW,en-US;q=0.7,en;q=0.3' --compressed -H 'Referer: https://www.videoslots.com/play/rooks-revenge-betsoft/' -b /tmp/cookie 'Cookie: flash_last_played=1706%2C4008%2C6517%2C3577%2C6097%2C3122%2C2674%2C4042%2C3325%2C6537%2C5490%2C2167%2C4093%2C5249%2C2673%2C4046%2C4052%2C2509%2C6541%2C5677%2C2322%2C5476%2C4060%2C4048%2C4796%2C4049%2C26%2C2548%2C1644%2C162%2C5880%2C4804%2C2659%2C5653%2C5840%2C4542%2C6080%2C282%2C2788%2C4819%2C6508%2C5483%2C5225%2C6502%2C5075%2C5003%2C6396%2C2005%2C5471%2C2676%2C6259%2C40%2C5861%2C1992%2C6460%2C5822%2C3090%2C5432%2C3923%2C4404%2C6386%2C5642%2C3568%2C114%2C4900%2C2657%2C6389%2C2006%2C5066%2C2267%2C2295%2C3921%2C4078%2C6082%2C3004%2C6225%2C6276; mobile_last_played=2660; __mmapiwsid=44884C05-0631-4C72-B0B4-2C7B96F46665:1d42cd9314268e1afd9e1ce0209e0c0058714bea;  tStatus=closed; afStatus=closed; afContent=af; _gat=1; _gat_UA-2711707-44=1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -D  flash.txt

#curl -L  'https://www.videoslots.com/phive/modules/Micro/play.php?5a212c5855ad0&game_id=bsgRooksRevenge&lang=en' -H 'Host: www.videoslots.com' -H 'User-Agent: Mozilla/5.0 (Android 7.0; Mobile; rv:57.0) Gecko/57.0 Firefox/57.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: zh-TW,en-US;q=0.7,en;q=0.3' --compressed -H 'Referer: https://www.videoslots.com/play/rooks-revenge-betsoft/' -b /tmp/cookie 'Cookie: flash_last_played=1706%2C4008%2C6517%2C3577%2C6097%2C3122%2C2674%2C4042%2C3325%2C6537%2C5490%2C2167%2C4093%2C5249%2C2673%2C4046%2C4052%2C2509%2C6541%2C5677%2C2322%2C5476%2C4060%2C4048%2C4796%2C4049%2C26%2C2548%2C1644%2C162%2C5880%2C4804%2C2659%2C5653%2C5840%2C4542%2C6080%2C282%2C2788%2C4819%2C6508%2C5483%2C5225%2C6502%2C5075%2C5003%2C6396%2C2005%2C5471%2C2676%2C6259%2C40%2C5861%2C1992%2C6460%2C5822%2C3090%2C5432%2C3923%2C4404%2C6386%2C5642%2C3568%2C114%2C4900%2C2657%2C6389%2C2006%2C5066%2C2267%2C2295%2C3921%2C4078%2C6082%2C3004%2C6225%2C6276; mobile_last_played=2660; __mmapiwsid=44884C05-0631-4C72-B0B4-2C7B96F46665:1d42cd9314268e1afd9e1ce0209e0c0058714bea;  tStatus=closed; afStatus=closed; afContent=af; _gat=1; _gat_UA-2711707-44=1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -D  flash.txt






echo -----------------------------------------------------------
echo username = $USERNAME 
echo email = $EMAIL 
echo country = $COUNTRY 
echo mobile = $MOBILE
echo firstname = $FIRSTNAME 
echo lastname = $LASTNAME 
echo sex = $SEX 
echo birth = $YEAR-0$MONTH-$DATE 
echo address = $ADDRESS city = $CITY zipcode = $ZIPCODE
echo -----------------------------------------------------------
echo $USERNAME >> $PWD/accounts/$COUNTRY-$NOW.txt

echo ------------------------------------------------------------------------------------------------------ >> $PWD/accounts/info.txt
echo username = $USERNAME >> $PWD/accounts/info.txt
echo email = $EMAIL >> $PWD/accounts/info.txt
echo country = $COUNTRY >> $PWD/accounts/info.txt
echo mobile = $MOBILE >> $PWD/accounts/info.txt
echo firstname = $FIRSTNAME >> $PWD/accounts/info.txt
echo lastname = $LASTNAME >>$PWD/accounts/info.txt
echo sex = $SEX >> $PWD/accounts/info.txt
echo birth = $YEAR-0$MONTH-$DATE >> $PWD/accounts/info.txt
echo address = $ADDRESS city = $CITY zipcode = $ZIPCODE >> $PWD/accounts/info.txt
echo ------------------------------------------------------------------------------------------------------ >> $PWD/accounts/info.txt

