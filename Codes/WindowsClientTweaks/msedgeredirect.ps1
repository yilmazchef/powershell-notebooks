(new-object net.webclient).DownloadFile('https://github.com/rcmaehl/MSEdgeRedirect/releases/download/0.6.3.0/MSEdgeRedirect.exe',"./MSEdgeRedirect.exe")
Start-Process -Filepath "./MSEdgeRedirect.exe"

