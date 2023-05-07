if [ "$1" = "upload" ]
    then
        if [ ! -d $K6_TEMP ]
        then
            mkdir $K6_TEMP
        fi
        source $CONFIG_FILE
        RESULT_DIR=`ls -d $K6_PREFFIX*`
        for i in `ls $RESULT_DIR`
        do
            RESULT_TIME=`stat -f "%Sm" -t "%d/%m/%Y - %H:%M:%S" $RESULT_DIR/$i`
            RESULT_CENARIO=`echo $i | cut -d "." -f 1`
            echo "{" > $K6_TEMP/temp.json
            echo "\"colecao\": \"$REPORT_AREA\"," >> $K6_TEMP/temp.json
            echo "\"projeto\": \"$REPORT_PROJECT\"," >> $K6_TEMP/temp.json
            echo "\"name\": \"$RESULT_CENARIO\"," >> $K6_TEMP/temp.json
            echo "\"timestamp\": \"$RESULT_TIME\"," >> $K6_TEMP/temp.json
            echo "\"resultado\": {" >> $K6_TEMP/temp.json
            cat $RESULT_DIR/$i | sed '1,1d' >> $K6_TEMP/temp.json
            echo "" >> $K6_TEMP/temp.json
            echo "}" >> $K6_TEMP/temp.json
            curl  -X POST -H "Content-Type: application/json" -d @$K6_TEMP/temp.json $REPORT_URL
        done
fi