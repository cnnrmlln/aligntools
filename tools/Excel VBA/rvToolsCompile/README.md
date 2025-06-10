## Excel VBA Script for compiling multiple vCenter reports

### Usage Instructions
> It is recommended to organize the vCenter reports you plan to compile in a seperate folder as the macro will open and compile all files inside that folder.
1. Download `RvToolCompileMacroV3.xlsm` - This file holds the macro, step-by-step instructions, and a few GUI buttons to initiate the macro
2. Download the vCenter reports you wish to compile and put them in their own folder
3. Step 3 in `RvToolCompileMacroV3.xlsm` is to compile the 'vInfo, 'vSource' and 'vTools' tabs. You will have to point the macro to the folder where the vCenter reports are located. This currently compiles the following parameters:  

| V-Center Host | VM | DNS Name | Creation Date | PowerOn | Host | OS according to the configuration file | Datacenter | Cluster | Provisioned MiB | Network #1 | Tools | CPUs | Memory | Annotation |
|-----|---|---|---|---|---|-------|---|---|---|---|---|---|---|---|

4. Step 4 in `RvToolCompileMacroV3.xlsm` is to compile just the 'vNetwork' tab. This currently compiles the following parameters:

| V-Center | VM | VM ID | Powerstate | NIC label | Adapter | Network | Switch | Connected | IPv4 Address | Datacenter | Cluster | Host |
|---|---|---|---|---|---|---|---|---|---|---|---|---|

>If done correctly, after steps 3 & 4, the macro workbook will now have additional worksheets with data populated. The logs tab will show row counts of the files and rows processed to ensure the macro did not miss any data. The consolidated data tabs will include the parameters listed in the table(s) above
