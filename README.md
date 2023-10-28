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
# Ví dụ [02.MultipleStagesDocker]
==============================================================

**Tham khảo**
- https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners/about-github-hosted-runners#supported-runners-and-hardware-resources
- https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-java-with-maven
- https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-go
- https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-python
- https://docs.github.com/en/actions/using-jobs/running-jobs-in-a-container


**Nội dung kịch bản GitHub Actions:**<br/>
- Nằm trong các files YAML thuộc folder `.github/workflows`
- File YAML mẫu, chẳng hạn như `multi-stages-docker.yaml`
```shell
name: GHAs - multiple stages
run-name: ${{ github.actor }} is testing out GitHub Actions 🚀
on: [push]
jobs:
  # Runner native với Môi trường Ubuntu 20.04
  Scripts-Ubuntu-20-04:
    runs-on: ubuntu-20.04
    steps:
      - run: echo This is the Ubuntu 20.04 from GHAs
      - run: pwd
      - run: ls -l
      - name: Check out repository code
        uses: actions/checkout@v4
      - run: echo After checking out codes, we will check it ...
      - run: ls -l
      - run: chmod +x ./multi-stages-docker/hello-script.sh
      - run: ./multi-stages-docker/hello-script.sh
      - run: echo --------------------------------------------------
      - name: Check Docker Containers
        run: docker ps
      - run: echo "Finish the first job :) ... "

  # Runner native với Môi trường Ubuntu 20.04
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

  # Runner native với Môi trường Mac OS (Big Sur)
  Show-Vars-Mac-OS:
    runs-on: macos-11
    steps:
      - run: echo "List some variables of GitHub Actions on Mac OS (Big Sur) ..."
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
      - name: List of the GitHub Actions environment variables on Mac OS (Big Sur)
        run: env
      - name: echo View Mac OS Version ...
        run: system_profiler
      - name: Check Docker Containers
        run: echo Currently, we cannot execute Docker on Mac OS with CLI `docker ps`
      - run: echo "Finish the Variables Job on Mac OS (Big Sur) ... "

  # Runner native với Môi trường Windows Server 2022
  Show-Vars-Windows:
    runs-on: windows-2022
    steps:
      - run: echo List some variables of GitHub Actions on Windows 2022 ...
      - run: echo $Env:CI
      - run: echo $Env:GITHUB_WORKFLOW
      - run: echo $Env:GITHUB_RUN_ID
      - run: echo $Env:GITHUB_RUN_NUMBER
      - run: echo $Env:GITHUB_ACTION
      - run: echo $Env:GITHUB_ACTIONS
      - run: echo $Env:GITHUB_ACTOR
      - run: echo $Env:GITHUB_REPOSITORY
      - run: echo $Env:GITHUB_EVENT_NAME
      - run: echo $Env:GITHUB_EVENT_PATH
      - run: echo $Env:GITHUB_WORKSPACE
      - run: echo $Env:GITHUB_SHA
      - run: echo $Env:GITHUB_REF
      - run: echo $Env:GITHUB_HEAD_REF
      - run: echo $Env:GITHUB_BASE_REF
      - run: echo $Env:GITHUB_SERVER_URL
      - run: echo $Env:GITHUB_API_URL
      - run: echo $Env:GITHUB_GRAPHQL_URL
      - run: echo $Env:PATH
      - name: List of the GitHub Actions environment variables on Windows 2022
        run: env
      - name: echo View Windows Version ...
        run: systeminfo | findstr /B /C:"OS Name" /B /C:"OS Version"
      - run: tree /f
      - run: dir
      - name: Check Docker Containers
        run: docker ps
      - run: echo "Finish the Variables Job on Windows ... "

  # Runner native với Môi trường Ubuntu 20.04 + Cài đật Java 11 + Maven
  Java-11-Maven:
    runs-on: ubuntu-20.04
    steps:
      - run: echo Run inside Ubuntu 20.04 + Java 11 + Maven ...
      - uses: actions/checkout@v4
      - name: Set up JDK 11 for x64
        uses: actions/setup-java@v3
        with:
          java-version: '11'
          distribution: 'temurin'
          architecture: x64
      - run: java --version
      - name: Check the Maven version
        run: mvn --version
      - name: Check Docker Containers
        run: docker ps

  # Runner native với Môi trường Ubuntu 20.04 + Cài đật Java 11 + Gradle
  Java-11-Gradle:
    runs-on: ubuntu-20.04
    steps:
      - run: echo Run inside Ubuntu 20.04 + Java 11 + Gradle ...
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
      - name: Check Docker Containers
        run: docker ps

  # Runner native với Môi trường Ubuntu 20.04 + Cài đật Python 3.12
  Python-3-12-Env:
    runs-on: ubuntu-20.04
    steps:
      - run: echo Run inside Ubuntu 20.04 + Python 3.12 ...
      - uses: actions/checkout@v4
      - name: Set up Python 3.12
        uses: actions/setup-python@v4
        with:
          python-version: 3.12
          architecture: 'x64'
      # You can test your matrix by printing the current Python version
      - name: Display Python version
        run: python -c "import sys; print(sys.version)"
      - name: Check Docker Containers
        run: docker ps

  # Runner native với Môi trường Ubuntu 20.04 + Cài đật NodeJS 20.9.0
  NodeJS-20-9-0:
    runs-on: ubuntu-20.04
    steps:
      - run: echo Run inside Ubuntu 20.04 + NodeJS 20.9.0 ...
      - uses: actions/checkout@v4
      - name: Set up NodeJS 20.9.0
        uses: actions/setup-node@v3
        with:
          node-version: 20.9.0
          architecture: 'x64'
      - name: Display NodeJS version
        run: node --version
      - name: Display NPM version
        run: npm --version
      - name: Check Docker Containers
        run: docker ps

  # Runner native với Môi trường Ubuntu 20.04 + Cài đật Ruby 3.1
  Ruby-3-1:
    runs-on: ubuntu-20.04
    steps:
      - run: echo Run inside Ubuntu 20.04 + Ruby 3.1 ...
      - uses: actions/checkout@v4
      - name: Set up Ruby 3.1
        uses: ruby/setup-ruby@ec02537da5712d66d4d50a0f33b7eb52773b5ed1
        with:
          ruby-version: 3.1
          architecture: 'x64'
      - name: Check Ruby version
        run: ruby --version
      - name: Check Docker Containers
        run: docker ps

  # Runner native với Môi trường Ubuntu 20.04 + Cài đặt Golang 1.20
  Golang-1-20:
    runs-on: ubuntu-20.04
    steps:
      - run: echo Run inside Ubuntu 20.04 + Golang 1.20 ...
      - uses: actions/checkout@v4
      - name: Set up Golang 1.20
        uses: actions/setup-go@v4
        with:
          go-version: 1.20
          architecture: 'x64'
      - name: Display Go version
        run: go version
      - name: Check Docker Containers
        run: docker ps

  # Runner Docker được host trên môi trường Ubuntu 20.04 + Docker Image node:18
  # Lưu ý rằng các lệnh trong Docker sẽ được thực thi dạng `sh` thay vì `bash`
  Docker-Container-NodeJS-18:
    runs-on: ubuntu-20.04
    container:
      image: node:18
      env:
        NODE_ENV: development
      ports:
        - 80
      volumes:
        - my_docker_volume:/volume_mount
      options: --cpus 1
    steps:
      - run: echo Run inside Ubuntu 20.04 + Docker Container ...
      - name: Check for dockerenv file
        run: (ls /.dockerenv && echo Found dockerenv) || (echo No dockerenv)
      - uses: actions/checkout@v4
      - name: View NodeJS version ...
        run: node --version
      - name: List all files
        run: ls -l
      - name: Execute hello-script.sh
        run: chmod +x ./multi-stages-docker/hello-script.sh && ./multi-stages-docker/hello-script.sh
      - run: echo Finish CI inside Docker Container of NodeJS

  # Runner Docker được host trên môi trường Ubuntu 20.04 + Docker Image maven:3.9.5-eclipse-temurin-11-alpine
  Docker-Container-Java-Maven:
    runs-on: ubuntu-20.04
    container:
      image: maven:3.9.5-eclipse-temurin-11-alpine
      env:
        BIEN_MT_01: Bien moi truong 01 cho Maven
        BIEN_MT_02: Bien moi truong 02 cho Maven
      options: --cpus 1
    steps:
      - run: echo Run inside Ubuntu 20.04 + Maven ...
      - uses: actions/checkout@v4
      - name: Check Java Version
        run: java --version
      - name: List all files
        run: ls -l
      - name: Execute hello-script.sh
        run: chmod +x ./multi-stages-docker/hello-script.sh && ./multi-stages-docker/hello-script.sh
      - name: Check Maven Version
        run: mvn --version
      - name: Show environments
        run: echo $BIEN_MT_01 && echo $BIEN_MT_02
      - run: echo Finish CI inside Docker Container of Maven

  # Runner Docker được host trên môi trường Ubuntu 20.04 + Docker Image python:3.12.0-alpine3.18
  Docker-Container-Python3-12:
    runs-on: ubuntu-20.04
    container:
      image: python:3.12.0-alpine3.18
      env:
        BIEN_MT_01: Bien moi truong 01 cho Python
        BIEN_MT_02: Bien moi truong 02 cho Python
      options: --cpus 1
    steps:
      - run: echo Run inside Ubuntu 20.04 + Python 3.18 ...
      - uses: actions/checkout@v4
      - name: Check Python Version
        run: python --version
      - name: List all files
        run: ls -l
      - name: Execute hello-script.sh
        run: chmod +x ./multi-stages-docker/hello-script.sh && ./multi-stages-docker/hello-script.sh
      - name: Check Python Version
        run: python --version
      - name: Show environments
        run: echo $BIEN_MT_01 && echo $BIEN_MT_02
      - run: echo Finish CI inside Docker Container of Python 3.18

  # Runner Docker được host trên môi trường Ubuntu 20.04 + Docker Image docker:24.0.6-dind-alpine3.18
  Docker-Container-DockerInDocker:
    runs-on: ubuntu-20.04
    container:
      image: docker:24.0.6-dind-alpine3.18
      env:
        BIEN_MT_01: Bien moi truong 01 cho DockerInDocker
        BIEN_MT_02: Bien moi truong 02 cho DockerInDocker
      options: --cpus 1
    steps:
      - run: echo Run inside Ubuntu 20.04 + Python 3.18 ...
      - uses: actions/checkout@v4
      - name: Execute hello-script.sh
        run: chmod +x ./multi-stages-docker/hello-script.sh && ./multi-stages-docker/hello-script.sh
      - name: Check Docker Version
        run: docker --version
      - name: Check Docker Containers
        run: docker ps
      - name: Show environments
        run: echo $BIEN_MT_01 && echo $BIEN_MT_02
      - run: echo Finish CI inside Docker Container of DockerInDocker

```

**Xem kết quả Pipeline ngay trên UI của GitHub**
```shell
https://github.com/trandungchien1982/github-actions/tree/02.MultipleStagesDocker
( PASSED / PENDING/ FAILED )
```
