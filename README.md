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
# Ví dụ [01.HelloWorld]
==============================================================

**Tham khảo**
- https://viblo.asia/p/cicd-github-actions-va-cac-kien-thuc-co-ban-EoW4oRMrVml
- https://docs.github.com/en/actions/quickstart
- https://www.youtube.com/watch?v=ZKaDy0mNHGs (Github Actions - CI/CD chưa bao giờ dễ hơn thế)


**Nội dung kịch bản GitHub Actions:**<br/>
- Nằm trong các files YAML thuộc folder `.github/workflows`
- File YAML mẫu, chẳng hạn như `hello-gha.yaml`
```shell
name: GitHub Actions Demo
run-name: ${{ github.actor }} is testing out GitHub Actions 🚀
on: [push]
jobs:
  Hello-GitHub-Actions:
    runs-on: ubuntu-20.04
    steps:
      - run: echo This is the Ubuntu 20.04
      - run: pwd
      - run: ls -l
      - name: Check out repository code
        uses: actions/checkout@v4
      - run: echo After checking out codes, we will check it ...
      - run: ls -l
      - run: chmod +x ./hello-world/hello-script.sh
      - run: ./hello-world/hello-script.sh
      - run: echo --------------------------------------------------
      - run: echo "Current GitHub workspace = ${{ job.workspace }}."
      - name: List files in the repository
        run: |
          ls ${{ github.workspace }}
      - run: echo "Finish the first job :) ... "

  Explore-Some-Features-GHAs:
    runs-on: ubuntu-20.04
    steps:
      - run: echo "🎉 The job was automatically triggered by a ${{ github.event_name }} event."
      - run: echo "🐧 This job is now running on a ${{ runner.os }} server hosted by GitHub!"
      - run: echo "🔎 The name of your branch is ${{ github.ref }} and your repository is ${{ github.repository }}."
      - name: Check out repository code
        uses: actions/checkout@v4
      - run: echo "💡 The ${{ github.repository }} repository has been cloned to the runner."
      - run: echo "🖥️ The workflow is now ready to test your code on the runner."
      - name: List files in the repository
        run: |
          ls ${{ github.workspace }}
      - run: echo "🍏 This job's status is ${{ job.status }}."
```

**Xem kết quả Pipeline ngay trên UI của GitHub**
```shell
https://github.com/trandungchien1982/github-actions/tree/01.HelloWorld
( PASSED / PENDING/ FAILED )
```
