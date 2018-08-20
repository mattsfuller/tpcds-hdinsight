for f in queries/*.sql; 
        do 
        for i in {1..10} ; 
                do 
                STARTTIME="`date +%s`"; 
                presto-cli --catalog hive --schema tpcds_sf1000_orc -f $f  > $f.run_$i.out 2>&1; 
                SUCCESS=$?; 
                ENDTIME="`date +%s`"; 
                echo "$f,$i,$SUCCESS,$STARTTIME,$ENDTIME,$(($ENDTIME-$STARTTIME))" 2>&1 | tee -a times_orc.csv; 
        done; 
done;