# CouchDB with python query server

This image adds to official CouchDB image a python3 query server. For general information on external query servers see [official documentation](https://docs.couchdb.org/en/stable/query-server/index.html).

Some (old, but still valid) benchmarks [are here](https://blog.idempotent.ca/2016/12/19/couchdb-indexing-benchmark/). Compared to default javascript views, python ones are generally faster, sometime much faster.

View server code is based on cmlenz [CouchDB-Python Library](https://github.com/djc/couchdb-python), patched by me so it works on (newer) python3.

## Image versioning

Tags are dash-separated couchdb and couchpy versions, plus an optional *+version* in case of a fix/important upgrade of tagged setup.

## Design document example

Use `python` in doc's `language` definition and you can define map/reduce functions in python!

```json
{
  "_id": "_design/my_design_doc",
  "_rev": "1-2e6d46b410ed9e76913f1a247fd129ef",
  "views": {
    "my_view": {
      "map": "def map(doc):\n    yield(doc['_id'], 1)",
      "reduce": "_count"
    }
  },
  "language": "python"
}
```
