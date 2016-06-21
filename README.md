# TesteProxy

This is a sample dymamic web project for validating the proxy configuration defined at Java Virtual Machine level.

In order to define a proxy, you have to define two system variables on JVM.

**For HTTP protocol :**
- http.proxyHost
- http.proxyPort


**For HTTPs protocol :**
- https.proxyHost
- https.proxyPort

Other option is to define at Operating System level as shown below:

- For http, use a command `export http_proxy=http://username:password@servername:port`
- For https, use a command `export https_proxy=https://username:password@servername:port`


#### To test the web application:
- First generate the .war file on eclipse
- Second, install it on application server
- Test and voilà
