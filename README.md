# 딱집 인프라 관리용 테라폼 메뉴얼

## 폴더 구조

- **Terraform 상태관리**
  - backend
- **크롤링 서버 인프라**
  - crawling
- **DB 관련 인프라**
  - modules
- **백엔드 서버 인프라**
  - development
  - stage
  - productions

## How to use?

### 0. 환경변수 세팅

```shell
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_REGION=""
```

### 1. 크롤링 서버 인프라

```shell
cd crawling
terraform plan
terraform apply
```
