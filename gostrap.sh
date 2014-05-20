#!/usr/bin/env bash

mkdir "$HOME/go"
export GOPATH=$HOME/go

export PATH=$PATH:$GOPATH/bin

mkdir -p "$GOPATH/src/github.com/$1"
mkdir "$GOPATH/src/github.com/$1/hello"

HELLO="$GOPATH/src/github.com/$1/hello/hello.go"

cat > $HELLO << EOF
package main

import (
    "fmt"
    "github.com/$1/newmath"
)

func main() {
    fmt.Printf("Hello, world.   Sqrt(2) = %v\n", newmath.Sqrt(2))
}
EOF

mkdir "$GOPATH/src/github.com/$1/newmath"
SQRT="$GOPATH/src/github.com/$1/newmath/sqrt.go"

cat > $SQRT << EOF
package newmath

func Sqrt(x float64) float64 {
    z := 1.0
    for i := 0; i < 1000; i++ {
        z -= (z*z - x) / (2 * z)
    }
    return z
}
EOF

`go build github.com/$1/newmath`

`go install github.com/$1/hello`
