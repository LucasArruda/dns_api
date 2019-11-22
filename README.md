# README

This run this application, please have docker installed.

#### Run:

```
docker-compose build
docker-compose up
```

#### In another terminal, run:

```
docker-compose run web rails db:create
docker-compose run web rails db:migrates
docker-compose run web rails db:seed
```

#### Running specs

While server is up (`docker-compose up`), run:

```
docker-compose run web rails test
```


#### Query with cUrl:

While server is up (`docker-compose up`), you can do all below

##### all results
```
curl -i -H "Accept: application/json" http://localhost:3000/dns_records\?page\=1
```

##### exclude some
```
curl -i -H "Accept: application/json" http://localhost:3000/dns_records\?page\=1\&excluded\[\]\=\ipsum.com
```

##### include some
```
curl -i -H "Accept: application/json" http://localhost:3000/dns_records\?page\=1\&included\[\]\=\ipsum.com
```

#### Create (POST) with cUrl
```
curl --data "dns_record[ip]=8.8.8.8&dns_record[hostnames_attributes][hostname]=ipsum.com" http://localhost:3000/dns_records
```
