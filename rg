#!/bin/bash

PWD=`pwd`
USERNAME=`cat $PWD/names.txt | shuf | head -1``shuf -i 100-9999 -n 1`
COUNTRY=$1
MOBILE='83'$RANDOM$RANDOM
UA=`cat $PWD/user-agent.txt | shuf | head -1`$RANDOM
FIRSTNAME=`cat $PWD/names.txt | shuf | head -1`
LASTNAME=`cat $PWD/top_1000_usa_familynames_english.txt | shuf | head -1`
ROAD=`cat $PWD/streets | shuf | head -1`
CITY=`cat $PWD/cities | shuf | head -1`
YEAR=`shuf -i 1972-1992 -n 1`
MONTH=`shuf -i 1-9 -n 1`
DATE=`shuf -i 10-28 -n 1`
ADDRESS="`shuf -i 1-199 -n 1` $ROAD"
ZIPCODE=$RANDOM
SEX=`cat $PWD/sex | shuf | head -1`

echo -e "#!/bin/env/python2\n\nfrom tempmail import TempMail\ntm = TempMail()\nemail = tm.get_email_address()\nprint email"  > tempmail/gettm.py

python2 tempmail/gettm.py > tmaddr

EMAIL=`cat tmaddr`
TMEMAIL="'$EMAIL'"

echo $UA > $PWD/ua

echo username=$USERNAME'&'email=$EMAIL'&'secemail=$EMAIL'&'password=$USERNAME'&'country=$COUNTRY'&'conditions=1'&'mobile=$MOBILE'&'country_prefix=1'&'email_code=1111 > $PWD/step1

curl -i -s -k  -X $'POST' \
    -H "@$PWD/ua" -H $'Referer: https://www.videoslots.com/registration1/' -H $'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H $'X-Requested-With: XMLHttpRequest' \
    --data-binary "@$PWD/step1"  -c $PWD/cookie \
    $'https://www.videoslots.com/phive/modules/Micro/registration_new.php?step1=true&lang=en'

sleep 5

echo -e "#!/bin/env/python2\n\nfrom tempmail import TempMail\ntm = TempMail()\nemail = $TMEMAIL\nprint tm.get_mailbox(email)" > tempmail/tm.py

python2 tempmail/tm.py > mail

./html2dic mail > mail2
EMAILCODES=`sed -n '31p' mail2`

echo firstname=$FIRSTNAME'&'lastname=$LASTNAME'&'address=$ADDRESS'&'zipcode=$ZIPCODE'&'city=$CITY'&'newsletter=1'&'over18=1'&'bonus_code=CM45'&'sex=$SEX'&'preferred_lang=en'&'dob=$YEAR-0$MONTH-$DATE'&'birthyear=$YEAR'&'birthmonth=0$MONTH'&'birthdate=$DATE'&'email_code=$EMAILCODES'&'currency=GBP > $PWD/step2




curl -i -s -k  -X $'POST' \
    -H "@$PWD/ua" -H $'Referer: https://www.videoslots.com/en/registration2/' -H $'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H $'X-Requested-With: XMLHttpRequest' \
    -b $PWD/cookie -c $PWD/cookie \
    --data-binary "@$PWD/step2" \
    $'https://www.videoslots.com/phive/modules/Micro/registration_new.php?lang=en' 

curl -i -s -k  -X $'POST' \
    -H $'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:55.0) Gecko/20100101 Firefox/55.0' -H $'Referer: https://www.videoslots.com/account/' -H $'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H $'X-Requested-With: XMLHttpRequest' \
    -b $PWD/cookie -c $PWD/cookie \
    --data-binary $'aid=323&action=use-trophy-award&lang=en' \
    $'https://www.videoslots.com/phive/modules/Micro/ajax.php'

curl -i -s -k  -X $'POST' \
    -H $'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:55.0) Gecko/20100101 Firefox/55.0'  -H $'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H $'X-Requested-With: XMLHttpRequest' \
     -b $PWD/cookie -c $PWD/cookie \
    --data-binary $'aid=324&action=use-trophy-award&lang=en' \
    $'https://www.videoslots.com/phive/modules/Micro/ajax.php'












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
echo $USERNAME >> $PWD/accounts/$COUNTRY-accounts.txt

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

