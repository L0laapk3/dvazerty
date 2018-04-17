# DVAZERTY

Programmers dvorak implementation that switches back to azerty while ctrl is held down.

### INSTALLATION INSTRUCTIONS

1. Run `build/dvazerty_*architecture*.msi`.
2. Log out (`shutdown -L`) or restart.

### ALTERNATIVE INSTALLATION INSTRUCTIONS

1. Place `build/*architecture*/DVAZERTY.dll` into `C:/WINDOWS/system32`.
2. Add the registry keys by running `dvazerty64.reg`.
3. Log out (`shutdown -L`) or restart.

### COMPILE FROM SOURCE

Alternatively, You can use **Microsoft Keyboard Layout Creator** To Compile `dvazerty.dll` yourself.  
Edit `*key* > All.. > Advanced View > Scan Code` to change ctrl shortcut.