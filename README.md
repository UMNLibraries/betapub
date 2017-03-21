# UMN Libraries Blacklight Sprint
Demo application for Blacklight / Solr and UMN Faculty scholarly publications

## Install dependencies
If Rails complains about missing Bundler dependencies...

```shell
$ cd path/to/betapub
$ bundle install
```

## Start Solr and Rails servers
Foreman will start the Rails web server and Solr services.

```shell
$ cd path/to/betapub
$ bundle exec foreman start
```

## Links to Local Servers
* [Blacklight rails application](http://localhost:3000/) / http://localhost:3000/
* [Solr Admin UI](http://localhost:8983/) / http://localhost:8983/

## Index Test Data
Run this command to index a small sample set of data.

```shell
$ cd path/to/betapub
$ cd vendor/solr
$ ./bin/post -c betapub ../../data/publication-data-limited.json
```
