#!/bin/bash

PYCMD=$(cat <<EOF

from datetime import datetime
import requests
currentTime = datetime.now().hour
bool = True
print('학교이름을 세글자 이상 입력하여주세요.')

while True:
  schoolName = input()
    
  if currentTime >= 0 and currentTime <= 9:
    menu = "breakfast"
    time = '아침'
  elif currentTime >= 10 and currentTime <= 12:
    menu = "lunch"
    time = '점심'
  elif currentTime >= 14 and currentTime <= 20:
    menu = "dinner"
    time = '저녁'
  elif currentTime >= 21:
    print('오늘은 더 이상 급식이 없습니다 !')
    bool = False
    break

  if bool == True:
    try:
      html = requests.get(f'https://scmeal.ml/{schoolName}')
      food = html.json()[menu]
      if food == None:
        print(f'오늘 {time}의 급식 정보가 없습니다.')
        break
      else:
        print(f'오늘의 {time} 메뉴입니다.')
        print(food)
        break
    except:
      print('학교명을 다시 확인해주세요.')
EOF
)

python3 -c "$PYCMD"