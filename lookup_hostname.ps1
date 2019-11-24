$list = @()
$basename = "demo-nationalparks-app"
$zeropad = 2
$azservers = az vm list --query '[].{Name:name}' -o tsv

foreach ($server in $azservers)
    {
    if ($server -like "$basename*")
        {
        $list += $server
        }
    }

$list = $list -replace "[^0-9]"
$list = [array]::IndexOf($list, ($list | sort-object | Select -last 1))
$nextnumber = $list +1
$nextnumber = ([string]$nextnumber).PadLeft($zeropad,'0')

$newcomputername = $basename + $nextnumber
write-host Name: $newcomputername

