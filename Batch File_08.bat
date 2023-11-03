@echo off
rem This line turns off echoing of each command.

setlocal enabledelayedexpansion
rem This line enables delayed variable expansion for !sourcePath! and !destinationPath!.

set /p sourcePath=Enter the source folder path:
rem This line prompts the user to enter the source folder path and stores it in the variable sourcePath.

set /p destinationPath=Enter the destination folder path:
rem This line prompts the user to enter the destination folder path and stores it in the variable destinationPath.

if not exist "!sourcePath!\" (
    echo Error: Source folder does not exist.
    goto :eof
)
rem This block checks if the source folder exists. If not, it displays an error message and exits the script.

if not exist "!destinationPath!\" (
    echo Error: Destination folder does not exist.
    goto :eof
)
rem This block checks if the destination folder exists. If not, it displays an error message and exits the script.

robocopy "!sourcePath!" "!destinationPath!" /E
rem This line uses robocopy to copy files and folders from sourcePath to destinationPath with the /E flag to copy subdirectories.

if errorlevel 8 (
    echo Error: ROBOCOPY encountered errors during the copy operation.
) else (
    echo Copy operation completed successfully.
)
rem This block checks the error level from robocopy. If it's 8 or higher, it indicates errors, and an error message is displayed. Otherwise, it shows a success message.

:end
endlocal
rem These lines mark the end of the script and close the local variable scope.
