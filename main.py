import pyautogui
import time

pyautogui.failsafe = False

print("Başlıyor !")
time.sleep(2)
counter = 0

for i in range(5):
    if counter <= 3:
        pyautogui.press("5")
        counter += 1
        print(counter)
        time.sleep(5.03)
    elif counter == 4:
        pyautogui.press("5")
        time.sleep(1.3)
        pyautogui.press("4")
        counter = 0

number = 100000
for i in range(number):
    time.sleep(2)
    pyautogui.press("3")
    time.sleep(1.2)
    pyautogui.press("2")
    time.sleep(1.2)
    pyautogui.press("5")
    time.sleep(1)
    pyautogui.press("4")
