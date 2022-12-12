#/bin/bash
seperator=------------------------
seperator=$seperator$seperator
rows="%-23s| %.10d| %3d| %c\n"
TableWidth=60

printf "%.${TableWidth}s\n" "$seperator"
printf "%-23s| %-10s| %.3s| %s\n" Name ID Age Grades
printf "%.${TableWidth}s\n" "$seperator"
printf "$rows" "Sherlock Holmes" 122 23 A
printf "$rows" "James Bond" 7 27 F
printf "$rows" "Hercules Poirot" 6811 59 G
printf "$rows" "Jane Marple" 1234567 71 C
printf "%.${TableWidth}s\n" "$seperator"