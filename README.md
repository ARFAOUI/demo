# Dispaying a tableview of bus stations with Google Maps Location Images and live updating for arrival time Using NSURLSessionTask (UnitTest included)


<br><b>Possible improvements:</b>
<br>1) storing the estimates in a proper object instead of displaying directly the data
<br>2) reading more then one bus arrival time in the same station (currently we are reading only the next one)
<br>3) update the datasource Array with the new estimates while they arrive when scrolling to avoid requesting them again when they appear the user scroll up again
