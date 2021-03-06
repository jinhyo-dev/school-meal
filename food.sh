#!/bin/bash

PYCMD=$(cat <<EOF
from datetime import datetime
import requests
import re

def addEmoticon(s):
  if "์์ฐํ๊น" in s:
    s += " ๐ค"
  if "๊ณ ๊ตฌ๋ง" in s:
    s += " ๐ "
  if "๋ฐฐ์ถ๊น์น" in s:
    s += " ๐ฅฌ"
  if "์๋ฐฅ" in s:
    s += " ๐"
  if "ํ์ธ์ ํ" in s:
    s += " ๐"
  if "๋ฒ ์ด์ปจ" in s:
    s += " ๐ฅ"
  if "์ค์ด" in s:
    s += " ๐ฅ"
  if "์ค์ง์ด" in s:
    s += " ๐ฆ"
  if "์๋ฌ๋" in s:
    s += " ๐ฅ"
  if "์น์ฆ" in s:
    s += " ๐ง"
  if "์ค๋ ์ง" in s:
    s += " ๐"
  if "์นํจ" in s:
    s += " ๐"
  if "์๋ฐ" in s:
    s += " ๐"
  if "๊ตญ" in s:
    s += " ๐ฒ"
  if "๋๊น์ค" in s:
    s += " ๐"
  if "๊ฐ์" in s:
    s += " ๐ฅ"
  if "๋ธ๋ก์ฝ๋ฆฌ" in s:
    s += " ๐ฅฆ"
  if "๋๋ฌผ" in s:
    s += " ๐ฑ"
  if "์คํ" in s:
    s += " ๐ฅฃ"
  if "ํผ์" in s:
    s += " ๐"
  if "์นํจ" in s:
    s += " ๐"
  if "๋ฎ๋ฐฅ" in s:
    s += " ๐"
  if "๋ฌ๊ฑ" in s:
    s += " ๐ฅ"
  if "ํค์" in s:
    s += " ๐ฅ"
  print(s)
  
  

currentTime = datetime.now().hour
bool = True

if currentTime >= 0 and currentTime <= 9:
  menu = "breakfast"
  time = '์์นจ'
elif currentTime >= 10 and currentTime <= 13:
  menu = "lunch"
  time = '์ ์ฌ'
elif currentTime >= 14 and currentTime <= 20:
  menu = "dinner"
  time = '์ ๋'
elif currentTime >= 21:
  print('์ค๋์ ๋ ์ด์ ๊ธ์์ด ์์ต๋๋ค !')
  bool = False

if bool == True:
  html = requests.get(f'https://meal.jinhyo.dev/๊ฒฝ๋ถ์')
  schoolName = html.json()['status']['searched_school']
  food = html.json()[menu]
  if food == None:
    print(f'{schoolName}์ ์ค๋ {time} ์ ๋ณด๊ฐ ์์ต๋๋ค.')
  else:
    print(f'{schoolName}์ ์ค๋ {time} ๐ฝ๏ธ  ๋ฉ๋ด์๋๋ค.')
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
