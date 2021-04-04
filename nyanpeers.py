from bs4 import BeautifulSoup
import requests

# get 
r = requests.get('http://localhost/katersnodes')
r.raise_for_status()

# 
soup = BeautifulSoup(r.content, features="html.parser")
trs = soup.findAll('tr')
trs = trs[1:len(trs)-2]
for tr in trs:
    print(f"addnode={tr.contents[0].text}:{tr.contents[1].text}")
