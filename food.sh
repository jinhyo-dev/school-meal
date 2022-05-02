#!/bin/bash

PYCMD=$(cat <<EOF
from datetime import datetime
import requests
import re

def addEmoticon(s):
  if "새우튀김" in s:
    s += " 🍤"
  if "고구마" in s:
    s += " 🍠"
  if "배추김치" in s:
    s += " 🥬"
  if "쌀밥" in s:
    s += " 🍚"
  if "파인애플" in s:
    s += " 🍍"
  if "베이컨" in s:
    s += " 🥓"
  if "오이" in s:
    s += " 🥒"
  if "오징어" in s:
    s += " 🦑"
  if "샐러드" in s:
    s += " 🥗"
  if "치즈" in s:
    s += " 🧀"
  if "오렌지" in s:
    s += " 🍊"
  if "치킨" in s:
    s += " 🍗"
  if "수박" in s:
    s += " 🍉"
  if "국" in s:
    s += " 🍲"
  if "돈까스" in s:
    s += " 🐖"
  if "감자" in s:
    s += " 🥔"
  if "브로콜리" in s:
    s += " 🥦"
  if "나물" in s:
    s += " 🌱"
  if "스프" in s:
    s += " 🥣"
  if "피자" in s:
    s += " 🍕"
  if "치킨" in s:
    s += " 🍗"
  if "덮밥" in s:
    s += " 🍛"
  if "달걀" in s:
    s += " 🥚"
  if "키위" in s:
    s += " 🥝"
  print(s)
  
  

currentTime = datetime.now().hour
bool = True

if currentTime >= 0 and currentTime <= 9:
  menu = "breakfast"
  time = '아침'
elif currentTime >= 10 and currentTime <= 13:
  menu = "lunch"
  time = '점심'
elif currentTime >= 14 and currentTime <= 20:
  menu = "dinner"
  time = '저녁'
elif currentTime >= 21:
  print('오늘은 더 이상 급식이 없습니다 !')
  bool = False

if bool == True:
  html = requests.get(f'https://meal.jinhyo.dev/경북소')
  schoolName = html.json()['status']['searched_school']
  food = html.json()[menu]
  if food == None:
    print(f'{schoolName}의 오늘 {time} 정보가 없습니다.')
  else:
    print(f'{schoolName}의 오늘 {time} 🍽️  메뉴입니다.')
    for i in food:
      tmp = i
      tmp = tmp.replace('*', '')
      tmp = tmp.replace('s', '')
      tmp = tmp.replace('a', '')
      tmp = tmp.replace('!', '')
      tmp = re.sub(pattern=r'\([^)]*\)', repl='', string=tmp)
      tmp = tmp.replace('(', '')
      tmp = tmp.replace(')', '')
      tmp = tmp.replace(' ', '')
      addEmoticon(tmp)
EOF
)
python3 -c "$PYCMD"
