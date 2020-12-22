# C_Project
A starting point for every C project.

## Building :hammer:

You can build your project in Release or Debug mode.
Once build, your executable will at the root of your projet directory.

### Release

In this mode, your project will be compiled with the following flags :
"*-Wall -Werror -Wextra -pedantic -std=c99*"

```sh
$ mkdir release
$ cd release
$ cmake ..
$ make
```

### Debug

In this mode, your project will be compiled with the following flags :
"*-Wall -Werror -Wextra -pedantic -std=c99 -g3*"
If the asan library is found on your machine, the "*-fsanitize=address*" flag will be add.
AddressSanitizer is a fast memory error detector.

```sh
$ mkdir debug
$ cd debug
$ cmake -DCMAKE_BUILD_TYPE=Debug ..
$ make
```
