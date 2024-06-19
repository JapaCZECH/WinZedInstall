if ([System.AppDomain]::CurrentDomain.FriendlyName -like "*.exe") {
    Write-Output "You are trying to run this script as an executable, which would result some errors. Please run the ps1 script."
    Exit
} 

Clear-Host
Write-Output "WELCOME TO JAPACZECH'S ZED INSTALLATION SCRIPT FOR WINDOWS!"
Write-Output "==========================================================="
Write-Output "Make sure to run this script in the parent directory of where you want zed to be."
$currentDir = (Get-Location).Path
Write-Output "============================"
Write-Output "Runnning dependencies tests:"
try {
    git --version
} catch {
    Write-Output "Git was not found. Please install it using scoop or choco."
    Exit
}
try {
    rustup -V
} catch {
    Write-Output "Rust was not found. Please install it using rust's official website. https://www.rust-lang.org/tools/install"
    Exit
}
try {
    cargo -V
}
catch {
    Write-Output "Cargo was not found. Please reinstall rust."
}
Write-Output "============================"
while ($true) {
    $userin = Read-Host "Do you have 'MSVC v*** - VS YYYY C++ x64/x86 build tools' installed? Y/N"
    if ($userin.ToLower() -eq "y") {
        break
    }
    elseif ($userin.ToLower() -eq "n") {
        Write-Output "Please install 'MSVC v*** - VS YYYY C++ x64/x86 build tools (latest)' using Visual Studio Installer."
        Exit
    } else {
        Write-Output "Invalid option"
        continue}
}
Write-Output "All dependencies are installed!"
Write-Output "==========================================================="
git clone https://github.com/zed-industries/zed/
Set-Location zed
Write-Output "ZED SOURCE CODE INSTALLED"
Write-Output "========================="
Write-Output "Choose your build:"
Write-Output "1. release"
Write-Output "2. testing"
Write-Output "3. debug"
Write-Output "========================="

while ($true)
{
    $option = Read-Host ">>> "
    if ($option -eq "1") {
        cargo run --release
        break
    } elseif ($option -eq "2") {
        cargo run --workspace
        break
    } elseif ($option -eq "3") {
        cargo run
        break
    } else {
        Write-Output "Invalid option."
    }
}
Set-Location ..
Write-Output "Zed build location is in $currentDir\zed\target\release\Zed.exe"
