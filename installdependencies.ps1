try {
    scoop -v
} catch {
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}
try {
    git --version
} catch {
    scopp install git
}
try {
    rustugp -V
} catch {
    $url = "https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe"
    $destination = ".\rustup-init.exe"

    Invoke-WebRequest -Uri $url -OutFile $destination

    Start-Process -FilePath $destination -ArgumentList '-y' -Wait

    Remove-Item $destination

}
try {
    cargo -V
}
catch {
    Write-Output "Cargo was not found. Please reinstall rust."
}
Write-Output "Using powershell scripts you CAN'T install c++ build tools, please do that manualy using visual studio."