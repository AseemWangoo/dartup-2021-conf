# DartUP 2021 Conf
- Topic : Dart on Cloud Run

<p>
  <a href="https://dartup.ru/EN/" target="_blank">
  <img src="https://d3n32ilufxuvd1.cloudfront.net/5baa4a0083c738006135489f/3152044/screenshot-64e960b9-596e-4f9f-a336-7985ca79bb73_readyscr_1024.jpg">
  </a>  
</p>

## Server URL
- https://dartup-conf-2021-rahizluroq-uc.a.run.app/

### Invoking local functions
- curl  http://0.0.0.0:8080/reqInfo

- curl -X POST -H "Content-Type: application/json" \
 -d '{"name": "aseem"}' \
 http://0.0.0.0:8080/postName

### Invoking cloudrun functions

- curl  https://dartup-conf-2021-rahizluroq-uc.a.run.app/helloworld
- curl  https://dartup-conf-2021-rahizluroq-uc.a.run.app/reqInfo

- curl -X POST -H "Content-Type: application/json" \
 -d '{"name": "aseem"}' \
 https://dartup-conf-2021-rahizluroq-uc.a.run.app/postName

 ### Fail calls
 - curl -X POST -H "Content-Type: application/json" \
 -d '' \
 http://0.0.0.0:8080/postName

  - curl -X POST -H "Content-Type: application/json" \
 -d {} \
 http://0.0.0.0:8080/postName

 curl -X POST -H "Content-Type: application/json" \
 -d '{"name": ""}' \
 http://0.0.0.0:8080/postName



