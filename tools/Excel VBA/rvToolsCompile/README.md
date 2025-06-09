## Excel VBA Script for compiling multiple vCenter reports

### Usage Instructions
1. Download `RvToolCompileMacroV3.xlsx` - This file holds the macro, step-by-step instructions, and a few GUI buttons to initiate the macro
2. Download the vCenter reports you wish to compile
3. Step 3 in `RvToolCompileMacroV3.xlsx` is to compile the 'vInfo, 'vSource' and 'vTools' tabs. This currently compiles the following parameters:  

| V-Center Host | VM | DNS Name | Creation Date | PowerOn | Host | OS according to the configuration file | Datacenter | Cluster | Provisioned MiB | Network #1 | Tools | CPUs | Memory | Annotation |
|-----|---|---|---|---|---|-------|---|---|---|---|---|---|---|---|

4. Step 4 in `RvToolCompileMacroV3.xlsx` is to compile just the 'vNetwork' tab. This currently compiles the following parameters:

| V-Center | VM | VM ID | Powerstate | NIC label | Adapter | Network | Switch | Connected | IPv4 Address | Datacenter | Cluster | Host |
|---|---|---|---|---|---|---|---|---|---|---|---|---|

