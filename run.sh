#!/bin/bash
pytest -v -s test1.py --html=./Reports/Test_Report_$(date "+%Y-%m-%d-%H:%M:%S").html
res=$(find -regex '.*/.*\.html')
if [ -e $res ]
then
    aws s3 cp $res s3://cqube-qa11-emission/Reports/UI_Report/
    sleep 5
    rm $res
else
    echo "HTML Report is not generated"
fi