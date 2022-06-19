# Anchor 
A template for developing C++ programmes in an ubuntu Docker container.

### Building the docker image
```sh
./anchor.sh build
```

### Running the docker image
```sh
./anchor.sh run
```

### Testing with `main.cpp`
Once in the docker container, run the following:
```sh
g++ main.cpp -o main
./main
```
We can test with valgrind as well:
```sh
valgrind ./main
```

## Contributing
This project uses `pre-commit`. Download it [here](https://pre-commit.com).