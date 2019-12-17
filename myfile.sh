#!/bin/bash

# sysinfo_page - A script to produce an HTML file


cat <<- _EOF_
    <html>
<head>
<style>

h1{
text-align:center;
}

tr, th{
  text-align: center;
  padding: 8px;
}
tr:nth-child(1){
background-color:green;
}
tr:nth-child(3){
background-color:green;
}
</style>
</head>
<body>

<h1>Loinux Server Report</h1><hr>


<h1>Os Details</h1>
<table border="4px" width="75%" align="center">
<tr>
<th>OS NAme</th>
<th>Kernal VErsion</th>
<th>IP Address</th>
<th>Up Time</th>
</tr>

<tr>
<td>$(lsb_release -d |awk '{print $2,$3,$4}')</td>
<td>$(uname -r)</td>
<td>$(hostname -I)</td>
<td>$(uptime |awk '{print $1,$2,$3,$4}')</td>
</tr>
</table>
<h1>Resources Utilization:</h1>
<table border="2px" width="75%"  align="center">
<tr>
   <th>Root Folder Usage</th>
   <th>Total Root Disk Size</th>
   <th>Load Average</th>
   <th>Used RAM (in MB)</th>
   <th>Total RAM (in MB)</th>
</tr>
<tr>
   <td>$(df -h|grep /dev/sda2 |awk '{print $5}') </td>
   <td>$(df -h|grep /dev/sda2 |awk '{print $2}')</td>
   <td>$(cat /proc/loadavg|awk '{print $1,$2,$3}')</td>
   <td>$(free -m|grep Mem|awk '{print $3}')</td>
   <td>$(free -m|grep Mem|awk '{print $2}')</td>
   </tr>
</table>

</body>
</html>


_EOF_

