curl $1|grep DEVOPS
if [ $? -ne 0 ]
then
        error=1
        echo "<?xml version='1.0'?>" > web.junit.xml
        echo "<testsuites>" >> web.junit.xml
        echo "<testsuite name='web-server' tests='1' failed='1' failures='1'>" >> web.junit.xml
        echo "<testcase name='curl' classname='web-server.Anonymous' target='local://' time='1.0'>" >> web.junit.xml
        echo "<failure message='expected INFRA'/>" >> web.junit.xml
        echo "</testcase>" >> web.junit.xml
        echo "</testsuite>" >> web.junit.xml
        echo "</testsuites>" >> web.junit.xml
else
        error=0
        echo "<?xml version='1.0'?>" > web.junit.xml
        echo "<testsuites>" >> web.junit.xml
        echo "<testsuite name='web-server' tests='1' failed='0' failures='0'>" >> web.junit.xml
        echo "<testcase name='curl' classname='web-server.Anonymous' target='local://' time='1.0'>" >> web.junit.xml
        echo "</testcase>" >> web.junit.xml
        echo "</testsuite>" >> web.junit.xml
        echo "</testsuites>" >> web.junit.xml
fi
exit ${error}

