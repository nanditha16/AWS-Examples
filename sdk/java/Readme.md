# Create a new Maven Project
```sh
mvn archetype:generate \
-DgroupId=com.s3.app \
-DartifactId=my-app \
-DarchetypeArtifactId=maven-archetype-quickstart \
-DarchetypeVersion=1.4 \
-DinteractiveMode=false
```

# Create a new Maven Project
<!-- https://docs.aws.amazon.com/sdk-for-java/latest/developer-guide/setup-project-maven.html  -->
```
mvn -B archetype:generate \
 -DarchetypeGroupId=software.amazon.awssdk \
 -DarchetypeArtifactId=archetype-lambda -Dservice=s3 -Dregion=US_EAST_1 \
 -DarchetypeVersion=2.25.69 \
 -DgroupId=com.S3.myapp \
 -DartifactId=myapp
```