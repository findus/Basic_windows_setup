function InstallWSL {
	dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
	dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
	wsl --set-default-version 2
}

function InstallChoco {
	Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

function InstallApps {
	choco install packages.config --yes
}

function WindowsSetupScript {
	./reclaim_win.cmd
}

#InstallChoco
#InstallWSL
#InstallApps
WindowsSetupScript

#Enable openssh agent
#add shortcuts to taskbar