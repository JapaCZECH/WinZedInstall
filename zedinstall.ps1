clear
echo "WELCOME TO JAPACZECH'S ZED INSTALLATION SCRIPT FOR WINDOWS!"
echo "==========================================================="
echo "Make sure to run this script in the parent directory of where you want zed to be."
$currentDir = (Get-Location).Path
echo "============================"
echo "Runnning dependencies tests:"
try {
    git --version
} catch {
    echo "Git was not found. Please install it using scoop or choco."
    Exit
}
try {
    rustup -V
} catch {
    echo "Rust was not found. Please install it using rust's official website. https://www.rust-lang.org/tools/install"
    Exit
}
try {
    cargo -V
}
catch {
    echo "Cargo was not found. Please reinstall rust."
}
echo "============================"
while ($true) {
    $userin = Read-Host "Do you have 'MSVC v*** - VS YYYY C++ x64/x86 build tools' installed? Y/N"
    if ($userin.ToLower() -eq "y") {
        break
    }
    elseif ($userin.ToLower() -eq "n") {
        echo "Please install 'MSVC v*** - VS YYYY C++ x64/x86 build tools (latest)' using Visual Studio Installer."
        Exit
    } else {
        echo "Invalid option"
        continue}
}
echo "All dependencies are installed!"
echo "==========================================================="
git clone https://github.com/zed-industries/zed/
cd zed
echo "ZED SOURCE CODE INSTALLED"
echo "========================="
echo "Choose your build:"
echo "1. release"
echo "2. testing"
echo "3. debug"
echo "========================="

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
        echo "Invalid option."
    }
}
cd ..
echo "Zed location is in $currentDir\zed\"
echo "Zed build location is in $currentDir\zed\target\release\Zed.exe"
