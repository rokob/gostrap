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

NEWMATH="$GOPATH/src/github.com/$1/newmath"
mkdir "$NEWMATH"
SQRT="$NEWMATH/sqrt.go"

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

SQRT_TEST="$NEWMATH/sqrt_test.go"

cat > $SQRT_TEST << EOF
package newmath

import "testing"

func TestSqrt(t *testing.T) {
    const in, out = 4, 2
    if x := Sqrt(in); x != out {
        t.Errorf("Sqrt(%v) = %v, want %v", in, x, out)
    }
}
EOF

`go build github.com/$1/newmath`

`go install github.com/$1/hello`
