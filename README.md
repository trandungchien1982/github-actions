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
# Ví dụ [04.UsingSecrets]
==============================================================

**Tham khảo**
- https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions
- https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/GitHub-Actions-Secrets-Example-Token-Tutorial
- https://docs.github.com/en/actions/learn-github-actions/variables
- https://github.com/orgs/community/discussions/42133
- https://github.com/orgs/community/discussions/27027


**Nội dung kịch bản GitHub Actions:**<br/>
- Nằm trong các files YAML thuộc folder `.github/workflows`
- File YAML mẫu, chẳng hạn như `pipeline-using-secrets.yaml`
```shell
name: GHAs - Using Secrets
run-name: ${{ github.actor }} for Using Secrets 🚀
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

  # Show Secrets + Public Environment variables ...
  Show-Secrets-Public-Vars:
    runs-on: ubuntu-20.04
    steps:
      - run: echo Show Secrets + Public Environment Variables ...
      - name: Check out repository code
        uses: actions/checkout@v4
      - run: pwd
      - run: ls -l
      - run: chmod +x ./gha-use-secrets/simple-script.sh
      - run: ./gha-use-secrets/simple-script.sh
        env:
          CONFIG_ROOT_URL: ${{ vars.CONFIG_ROOT_URL }}
          CONFIG_RABBIT_MQ_URL: ${{ vars.CONFIG_RABBIT_MQ_URL }}
          LOGIN_DOCKER_USR: ${{ secrets.LOGIN_DOCKER_USR }}
          LOGIN_DOCKER_PWD: ${{ secrets.LOGIN_DOCKER_PWD }}
      - run: echo --------------------------------------------------
      - run: echo Show public variables ...
      - run: echo CONFIG_ROOT_URL = $CONFIG_ROOT_URL
      - run: echo CONFIG_RABBIT_MQ_URL = $CONFIG_RABBIT_MQ_URL
      - run: echo "vars.CONFIG_ROOT_URL = ${{ vars.CONFIG_ROOT_URL }}"
      - run: echo "vars.CONFIG_RABBIT_MQ_URL = ${{ vars.CONFIG_RABBIT_MQ_URL }}"
      - run: echo --------------------------------------------------
      - run: echo Show secret variables ...
      - run: echo LOGIN_DOCKER_USR = $LOGIN_DOCKER_USR
      - run: echo LOGIN_DOCKER_PWD = $LOGIN_DOCKER_PWD
      - run: echo secrets.LOGIN_DOCKER_USR = ${{ secrets.LOGIN_DOCKER_USR }}
      - run: echo secrets.LOGIN_DOCKER_PWD = ${{ secrets.LOGIN_DOCKER_PWD }}
      - run: echo "Finish the first job :) ... "
```

**Xem kết quả Pipeline ngay trên UI của GitHub**
```shell
https://github.com/trandungchien1982/github-actions/tree/04.UsingSecrets
( PASSED / PENDING/ FAILED )
```
