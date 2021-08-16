import pyautogui
import time

print("Başlıyor !")
time.sleep(2)

number = 22

for i in range(number):
    pyautogui.click(x=140, y=404)
    time.sleep(1)
    pyautogui.click(x=197, y=699)
    time.sleep(1.5)
    pyautogui.click(x=140, y=404)
    time.sleep(1)
    pyautogui.click(x=122, y=699)
    time.sleep(1)
