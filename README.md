# GitHub Actions
Các ví dụ liên quan đến GitHub Actions từ cơ bản đến nâng cao<br/>
Mỗi nhánh trong Repo sẽ là 1 ví dụ/ giải pháp/ project mẫu trong GitHub Actions

# Môi trường phát triển
- Ubuntu 20.04 LTS
- Docker
- K8S

# Folder liên quan trên Windows
```
D:\Projects\github-actions
```

==============================================================
# Ví dụ [03.Pipeline4Java]
==============================================================

**Tham khảo**
- https://stackoverflow.com/questions/63148639/create-dependencies-between-jobs-in-github-actions
- https://docs.github.com/en/actions/using-jobs/using-jobs-in-a-workflow
- https://docs.github.com/en/actions/using-workflows/storing-workflow-data-as-artifacts


**Nội dung kịch bản GitHub Actions:**<br/>
- Nằm trong các files YAML thuộc folder `.github/workflows`
- File YAML mẫu, chẳng hạn như `pipeline-4-java.yaml`
```shell
name: GHAs - HelloWorld JavaApps
run-name: ${{ github.actor }} for HelloWorld JavaApps 🚀
on: [push]
jobs:
  # Show all variables
  Show-Vars-Ubuntu-20-04:
    runs-on: ubuntu-20.04
    steps:
      - run: echo List some variables of GitHub Actions ...
      - run: echo $CI
      - run: echo $GITHUB_WORKFLOW
      - run: echo $GITHUB_RUN_ID
      - run: echo $GITHUB_RUN_NUMBER
      - run: echo $GITHUB_ACTION
      - run: echo $GITHUB_ACTIONS
      - run: echo $GITHUB_ACTOR
      - run: echo $GITHUB_REPOSITORY
      - run: echo $GITHUB_EVENT_NAME
      - run: echo $GITHUB_EVENT_PATH
      - run: echo $GITHUB_WORKSPACE
      - run: echo $GITHUB_SHA
      - run: echo $GITHUB_REF
      - run: echo $GITHUB_HEAD_REF
      - run: echo $GITHUB_BASE_REF
      - run: echo $GITHUB_SERVER_URL
      - run: echo $GITHUB_API_URL
      - run: echo $GITHUB_GRAPHQL_URL
      - run: echo $PATH
      - name: List of the GitHub Actions environment variables on Ubuntu 20.04
        run: env
      - name: View Ubuntu OS Version ...
        run: lsb_release -a
      - name: Check Docker Containers
        run: docker ps
      - run: echo "Finish the Variables Job on Ubuntu 20.04 ... "

  # Check Lint Java for coding style, syntax, ...
  Check-Lint-Java:
    runs-on: ubuntu-20.04
    steps:
      - run: echo Check Lint Java + Syntax + Code Smell [TODO ...]
      - name: Check out repository code
        uses: actions/checkout@v4
      - run: pwd
      - run: ls -l
      - run: chmod +x ./gha-ci-java/simple-script.sh
      - run: ./gha-ci-java/simple-script.sh
      - run: echo --------------------------------------------------
      - name: Check Docker Containers
        run: docker ps
      - run: echo "Finish the first job :) ... "

  # Build Java with JDK 11 + Gradle
  Build-Java-11-Gradle:
    runs-on: ubuntu-20.04
    needs: Check-Lint-Java
    steps:
      - run: echo Build Java in JDK 11 + Gradle ...
      - uses: actions/checkout@v4
      - name: Set up JDK 11 for x64
        uses: actions/setup-java@v3
        with:
          java-version: '11'
          distribution: 'temurin'
          architecture: x64
      - name: Check Java Version
        run: java --version
      - name: Check Gradle Version
        run: gradle --version
      - name: Build Java Apps using Gradle ...
        run: gradle clean build --build-file ./hello-world-app/build.gradle
      - run: echo Finish build Java project using Gradle, we will have the ./hello-world-app/build/libs/hello-world-0.0.1-SNAPSHOT.jar
      - run: ls -l ./hello-world-app/build/libs
      - name: Save artifacts for next steps
        uses: actions/upload-artifact@v3
        with:
          name: the-build-output-hello-world
          path: |
            hello-world-app/build/libs/*.jar
          retention-days: 30
      - run: echo Build Completed!

  # Build Docker Image
  Build-Docker-Image:
    runs-on: ubuntu-20.04
    needs: [Check-Lint-Java, Build-Java-11-Gradle]
    steps:
      - run: echo Build Docker Image [TODO ...]
      - uses: actions/checkout@v4
      - name: Download build artifact (JAR files)
        uses: actions/download-artifact@v3
        with:
          name: the-build-output-hello-world
          path: hello-world-app/build/libs/
      - name: Display structure of downloaded files
        run: ls -R
        working-directory: hello-world-app/build/libs/
      - run: pwd
      - run: ls -l
      - run: docker --version
      - run: echo Try to list all artifacts in previous steps ...
      - run: ls -l
      - run: chmod +x ./build-docker.sh
      - run: ./build-docker.sh
      - run: echo Finish Push package project to Docker Registry in [Docker in Docker] env ...
      - run: echo Build Docker Completed!
```

**Xem kết quả Pipeline ngay trên UI của GitHub**

```shell
https://github.com/trandungchien1982/github-actions/tree/03.Pipeline4Java
( PASSED / PENDING/ FAILED )
```
