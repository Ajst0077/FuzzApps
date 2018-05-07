if [ ! $start ]; then
    start=0
fi
i=0
for file in /work/out/slave1/crashes/* do 
    if [ "$i" -ge "$start" ]; then 
        echo $file;
        /work/xpdf-4.00/xpdf/pdftohtml $file 1/;
        echo $file; 
        read
    fi
    i=$[i+1]
done
