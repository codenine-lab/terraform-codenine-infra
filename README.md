# Codenine 인프라 관리용 Terraform

## 폴더 구조

- **Terraform 상태관리**
  - backend
- **DB 관련 인프라**
  - database
- **딱집 인프라(ddakzip)**
  - **개발용 백엔드**
    - development
  - **배포용 백엔드**
    - productions
  - **크롤링 서버 구축용**
    - crawling
  - **서비스들(웹뷰...etc)**
    - services

## How to use?

### 0. 환경변수 세팅

```shell
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_REGION=""
```
