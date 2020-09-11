#!/usr/bin/env bash

# 새 버전번호 입력
read -p "릴리즈할 버전번호(예: 1.0.0)>  " NEW_VERSION

# 버전번호 형식 체크
if [[ ! $NEW_VERSION =~ [0-9]+\.[0-9]+\.[0-9]+ ]]
then
    echo "버전은 {MAJOR_VERSION}.{MINOR_VERSION}.{PATCH_VERSION} 형식이어야 함"
    exit 1
fi

# git 최신 버전으로 pull
git pull

# build.gradle 파일에 버전 번호 변경
sed -i "s/^version = '.*-SNAPSHOT'$/version = '${NEW_VERSION}-SNAPSHOT'/" build.gradle

# git commit 후 push
git add .
git commit -m "릴리즈: :bookmark: v${NEW_VERSION} 릴리즈"
git tag v${NEW_VERSION}
git push --tags