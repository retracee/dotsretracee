#!/bin/bash
#there is no line 1
mem(){
    mem=`free | awk '/Mem/{printf("%.1f%"), $3/($2+.000000001)*100} /buffers\/cache/{printf(", buffers: %.1f%"), $4/($3+$4)+.000000001*100}';`
    echo -e "$mem"
    }

dte(){
    dte=`date +"%a %m/%d/%y"`
    echo -e "$dte"
}

tme(){
    dte2=`date +"%l:%M %p"`
    echo -e "$dte2"
}

tmp(){
s="$(sensors coretemp-isa-0000)"
echo ${s:53:10}
}

cpu(){
        top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1"%"}'
           echo -e "$cpu"
}


wthr(){ 
/home/gavin/.config/weather 
}

while true; do
	xsetroot -name " $(cpu) $(tmp)     $(mem)    $(wthr)     $(dte)    $(tme) "
	sleep 5s
done

