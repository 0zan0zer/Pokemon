import pytesseract
import pyautogui
import cv2
import numpy as np
import time

pytesseract.pytesseract.tesseract_cmd = r"C:\Program Files\Tesseract-OCR\tesseract.exe"


def get_name(x, y, w, h):
    pic = pyautogui.screenshot(region=(x, y, w, h))
    pic = np.array(pic)
    pic = pic[:, :, ::-1].copy()
    pic = cv2.resize(pic, (1000, 130))
    gray = cv2.cvtColor(pic, cv2.COLOR_BGR2GRAY)
    retval, threshold = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY)
    cv2.imshow("Result", threshold)
    cv2.waitKey(0)
    print(pytesseract.image_to_string(threshold))


def search_battle(x, y):
    while True:
        time.sleep(1)
        pix = pyautogui.screenshot(region=(x, y, 1, 1))
        pix_color = pix.getpixel((0, 0))
        if pix_color == (114, 73, 64):
            print("Battle!")
            break
