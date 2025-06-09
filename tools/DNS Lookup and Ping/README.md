# DNS Lookup Tool

This PowerShell script takes a list of IPs or FQDNs and performs:

- Forward DNS Lookup
- Reverse DNS Lookup
- Ping Test

##  Usage

1. Add targets to `url-list.txt` (1 per line)
2. Edit the input/output file locations `DNS-Reverselookup.ps1`
3. Run `DNS-Reverselookup.ps1`
4. Output is saved to `url-output.csv`


###  Output Fields

- ComputerName
- ResolvesToIP
- IPResolvesTo
- PingStatus
- DNS A Record(s)
- PTR Record
- Ping Result

> Ensure access to internal DNS from your VDI session.
