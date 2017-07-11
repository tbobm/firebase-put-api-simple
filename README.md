# fireapi

Quick and dirty API using Firebase

## Installation

The preferred way for running the app is trough Docker.
Simply execute the following:

```bash
docker build -t sina .
docker run -it --rm -e FIREBASE_URI="MY_URI" -p 8080:8080 sina
```

