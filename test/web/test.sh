curl $1|grep DEVXPS
if [ $? -ne 0 ]
then
        error=1
        echo "<?xml version='1.0'?>" > TEST-web.junit.xml
        echo "<testsuites>" >> TEST-web.junit.xml
        echo "<testsuite name='web-server' tests='1' failed='1' failures='1'>" >> TEST-web.junit.xml
        echo "<testcase name='curl' classname='web-server.Anonymous' target='local://' time='1.0'>" >> TEST-web.junit.xml
        echo "<failure message='expected INFRA'/>" >> TEST-web.junit.xml
        echo "</testcase>" >> TEST-web.junit.xml
        echo "</testsuite>" >> TEST-web.junit.xml
        echo "</testsuites>" >> TEST-web.junit.xml
else
        error=0
        echo "<?xml version='1.0'?>" > TEST-web.junit.xml
        echo "<testsuites>" >> TEST-web.junit.xml
        echo "<testsuite name='web-server' tests='1' failed='0' failures='0'>" >> TEST-web.junit.xml
        echo "<testcase name='curl' classname='web-server.Anonymous' target='local://' time='1.0'>" >> TEST-web.junit.xml
        echo "</testcase>" >> TEST-web.junit.xml
        echo "</testsuite>" >> TEST-web.junit.xml
        echo "</testsuites>" >> TEST-web.junit.xml
fi
exit ${error}

