import pyautogui, time

def loading():
    moved = False
    time.sleep(2)
    while not moved:
        sw = pyautogui.locateOnScreen('loading.png',confidence=0.7) 
        if sw is None: moved = True
        time.sleep(0.5)
    exit()

# Click 'X'
pyautogui.moveTo(1622, 28)
pyautogui.click()

sw = pyautogui.locateOnScreen('worldswitch.png') 
if sw is None:
    time.sleep(.1)
else:
    pyautogui.moveTo(1529,913)
    pyautogui.click()
    time.sleep(3)

if pyautogui.pixel(1538, 795)[1]==82:
    pyautogui.moveTo(1538, 811)
    pyautogui.click()
    loading()
elif pyautogui.pixel(1538, 811)[1]==82:
    pyautogui.moveTo(1538, 828)
    pyautogui.click()
    loading()
elif pyautogui.pixel(1538, 828)[1]==82:
    pyautogui.moveTo(1538, 843)
    pyautogui.click()
    loading()
elif pyautogui.pixel(1538, 843)[1]==82:
    pyautogui.moveTo(1538, 863)
    pyautogui.click()
    loading()
elif pyautogui.pixel(1538, 863)[1]==82:
    pyautogui.moveTo(1538, 878)
    pyautogui.click()
    loading()
elif pyautogui.pixel(1538, 878)[1]==82:
    pyautogui.moveTo(1538,893)
    pyautogui.click()
    loading()
elif pyautogui.pixel(1538,893)[1]==82:
    pyautogui.moveTo(1538, 908)
    pyautogui.click()
    loading()
elif pyautogui.pixel(1538, 908)[1]==82:
    pyautogui.moveTo(1538, 923)
    pyautogui.click()
    loading()
elif pyautogui.pixel(1540, 923)[1]==82:
    pyautogui.moveTo(1538, 795)
    pyautogui.click()
    loading()
else:
    pyautogui.moveTo(1538, 795)
    pyautogui.click()
    loading()