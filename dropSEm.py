import pyautogui

s=pyautogui.locateOnScreen('saphire.png',confidence=.8)
if s:
    pyautogui.moveTo(873,8)
    pyautogui.click() 
    pyautogui.moveTo(s.left+10,s.top+18)
    pyautogui.keyDown('shiftleft')
    pyautogui.click()
    pyautogui.keyUp('shiftleft')

e=pyautogui.locateOnScreen('emerald.png',confidence=.8)
if e:
    pyautogui.moveTo(873,8)
    pyautogui.click() 
    pyautogui.moveTo(e.left+10,e.top+18)
    pyautogui.keyDown('shiftleft')
    pyautogui.click()
    pyautogui.keyUp('shiftleft')
