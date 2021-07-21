from tkinter import *
from Functions import *

root = Tk()
root.title("PPOT")
root.geometry("200x200")

name_button = Button(root, text="Get Name", command=lambda: get_name(500, 414, 100, 12))
name_button.grid(column=1, row=1)

battle_mode = Button(root, text="Activate Battle", command=lambda: search_battle(370, 544))
battle_mode.grid(column=1, row=2)

root.mainloop()

# region=(500, 413, 100, 13)
