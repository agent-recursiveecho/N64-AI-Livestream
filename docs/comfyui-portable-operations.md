# ComfyUI Portable Operations

## Location

ComfyUI Portable is located at:

C:\Users\Living Room\workspace\N64-AI-Livestream\comfyui-portable

## Start ComfyUI Portable

Open the VS Code PowerShell terminal and run:

Set-Location "C:\Users\Living Room\workspace\N64-AI-Livestream\comfyui-portable"
.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build

Keep the terminal open while ComfyUI is running.

## Stop ComfyUI Portable

Preferred method:

Press Ctrl+C in the terminal where ComfyUI is running.

If ComfyUI must be forcibly stopped, first identify the Python process:

Get-Process python*

For more detail:

Get-CimInstance Win32_Process | Where-Object { $_.Name -like "python*" } | Select-Object ProcessId, Name, CommandLine

Then stop the correct ComfyUI process:

Stop-Process -Id <PROCESS_ID> -Force

Example observed during testing:

Stop-Process -Id 25528 -Force

IMPORTANT: The process ID changes between launches. Do not assume 25528 will remain valid.
