# Attentif - Dementia Hack

## Dependencies:

### macOS

go
```
brew install go
go get github.com/larissavoigt/attentif
cd ~/go/src/github.com/larissavoigt/attentif
go get -u
```

MySQL
```
brew install mysql
brew services start mysql
mysql -u root < database/migrate.sql
```

## Run

```
go run server.go
```




