# Read the numbers values and sort unique values on intervals of consecutive numbers
# v1 25.09.2019 - Initial version                                                   

$Low=0
$High=0

# Import the CDP CSV file
$CSVFile = Import-Csv C:\Temp\CSVFile.csv -Delimiter ","

# String processing
$Numbers = @()
foreach ($Number in $CSVFile){ 
    $GetNumber = $($Number.Numbers)
    $Numbers+=[int]$GetNumber
}

# Sorting and intervals processing
$NumbersInterval=@()
$SortedNumbers = $Numbers | Sort-Object -Unique
$Length = $SortedNumbers.Length
$i = 0
while ($i -lt $Length) {
	$Low = $SortedNumbers[$i]
	while (($i -le $Length-1) -and ($SortedNumbers[$i]+1 -eq $SortedNumbers[$i+1])) {
	    $i++
		$High = $SortedNumbers[$i]
	}
    $High=$SortedNumbers[$i]
    $i++
    if ($High -eq $Low) {
        $NumbersInterval_temp=$Low.ToString() 		
    }
	else {
        $NumbersInterval_temp=$Low.ToString() + "-" + $High.ToString() 
    }
	$NumbersInterval+=$NumbersInterval_temp
}


# Result on CLI for copy / paste
$NumbersInterval
