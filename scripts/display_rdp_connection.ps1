"Conten-type:application/json"
""
Get-NetTCPConnection | Where-Object -filterScript {$_.RemotePort -eq 3389} | ConvertTo-Json
