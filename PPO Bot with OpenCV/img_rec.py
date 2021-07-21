import cv2
import numpy as np
import pyautogui

pic = pyautogui.screenshot(region=(0, 330, 960, 400))
pic = np.array(pic)
map_img = pic[:, :, ::-1].copy()

grass_img = cv2.imread(r"D:\Screenshots\Grass.png", cv2.IMREAD_UNCHANGED)

cv2.imshow("Map", map_img)
cv2.waitKey(0)
# cv2.imshow("Grass", grass_img)
# cv2.waitKey(0)

result = cv2.matchTemplate(map_img, grass_img, cv2.TM_CCOEFF_NORMED)
cv2.imshow("Res", result)
cv2.waitKey(0)

min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(result)

w = grass_img.shape[1]
h = grass_img.shape[0]

yloc, xloc = np.where(result >= .80)

rectangles = []
for (x, y) in zip(xloc, yloc):
    rectangles.append([int(x), int(y), int(w), int(h)])
    rectangles.append([int(x), int(y), int(w), int(h)])

for (x, y, w, h) in rectangles:
    cv2.rectangle(map_img, (x, y), (x + w, y + h), (0, 255, 255), 2)

rectangles, weights = cv2.groupRectangles(rectangles, 1, .2)
cv2.imshow("Map", map_img)
cv2.waitKey(0)

print(len(rectangles))
print(rectangles)

# region= (312, 411, 340, 229) = Battle_Screenshot
# region= (495, 455, 33, 32) = Grass
d