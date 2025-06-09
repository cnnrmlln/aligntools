# Path to the text file with list of target hosts
$targetFile = "\\wdcnapvs505.internal.cigna.com\Home11$\C8K3JT\Desktop\scripts\Other Tools\tracert\targets.txt"

# Output CSV path
$outputCsv = "\\wdcnapvs505.internal.cigna.com\Home11$\C8K3JT\Desktop\scripts\Other Tools\tracert\traceroute_results.csv"

# Check if target file exists
if (-not (Test-Path $targetFile)) {
    Write-Host "Target file '$targetFile' not found. Please create it with one host per line."
    exit
}

# Read non-empty lines from the file
$targets = Get-Content $targetFile | Where-Object { $_.Trim() -ne "" }

# Initialize results array
$results = @()

foreach ($target in $targets) {
    Write-Host "Tracing route to $target..."

    # Run tracert
    $traceOutput = tracert $target

    # Skip the header lines
    $traceOutput = $traceOutput[4..($traceOutput.Count - 1)] 2>$null

    foreach ($line in $traceOutput) {
        if ($line -match "^\s*(\d+)\s+(.*)$") {
            $hop = $matches[1]
            $details = $matches[2]

            # Extract latencies
            $latencies = @()
            $hostname = ""
            $ip = ""

            # Match up to three latency numbers (e.g., 1 ms  2 ms  3 ms)
            if ($details -match "(\d+ ms)\s+(\d+ ms)\s+(\d+ ms)") {
                $latencies += $matches[1], $matches[2], $matches[3]

                # Get remaining portion after the latencies
                $afterLatencies = $details.Substring($matches[0].Length).Trim()

                # Extract hostname and IP if present
                if ($afterLatencies -match "^(.*)\s+\[(\d{1,3}(\.\d{1,3}){3})\]$") {
                    $hostname = $matches[1].Trim()
                    $ip = $matches[2]
                } elseif ($afterLatencies -match "^(\d{1,3}(\.\d{1,3}){3})$") {
                    $ip = $matches[1]
                    $hostname = ""
                } else {
                    $hostname = $afterLatencies
                }
            } elseif ($details -like "*Request timed out.*") {
                $latencies = @("Request timed out", "", "")
                $hostname = ""
                $ip = ""
            } else {
                # Handle any unexpected format
                $latencies = @("N/A", "", "")
                $hostname = $details
                $ip = ""
            }

            # Create object
            $results += [PSCustomObject]@{
                TargetHost = $target
                HopNumber = $hop
                Latency1 = $latencies[0]
                Latency2 = $latencies[1]
                Latency3 = $latencies[2]
                Hostname = $hostname
                IPAddress = $ip
            }
        }
    }
}

# Export to CSV
$results | Export-Csv -Path $outputCsv -NoTypeInformation -Encoding UTF8

Write-Host "Detailed traceroute results saved to '$outputCsv'"