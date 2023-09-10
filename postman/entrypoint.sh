newman run api.postman_collection.json -e api.postman_environment.json \
-k -r htmlextra,cli,junit \
--env-var "HOST=$HOST" \
--reporter-htmlextra-export="reports/report.html" \
--reporter-junit-export="reports/junitReport.xml"
# --delay-request 500
status=$?
chmod -R o+rwx ./reports
exit $status
