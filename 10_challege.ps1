# Print all active processes ordered by highest CPU time consumption
Get-Process | Sort-Object -Property CPU -Descending

# Print all active processes ordered by highest Process Identification Number (PID)
Get-Process | Sort-Object -Property Id -Descending

# Print the top five active processes ordered by highest Working Set (WS(K))
Get-Process | Sort-Object -Property WS -Descending | Select-Object -First 5

# Start a browser process (MS Edge) and open a website
Start-Process "msedge" "https://owasp.org/www-project-top-ten/"

# Start Notepad ten times using a for loop
for ($i = 1; $i -le 10; $i++) {
    Start-Process "notepad"
}

# Wait for user to perform some actions (e.g., editing in Notepad)
# Then close all instances of Notepad
Stop-Process -Name "notepad" -Force

# Kill a process by its Process Identification Number (PID)
# Replace <PID_TO_KILL> with the actual PID of the process to be killed
Stop-Process -Id 12346 -Force
