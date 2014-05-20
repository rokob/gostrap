As I was getting into Go development, I naturally came across the [golang][golang] website.
On this site, there was an explanation of [how to structure your code][golangtut] to use
the Go tool. But, why would you have to do this manually? This bash script bootstraps
the workspace structure that they advocate in this tutorial, including the examples
that are given. Probably not that useful for anyone, but it puts all of the steps you should
follow in one clear place.

## Usage

You need to source this script and not just run it in order to set environment variables
properly. The shortcut for sourcing is just a single '.' so the basic usage is

```
$ . ./gostrap.sh <github-username>
```

![ScreenShot](/usage.png)

[golang]:      http://golang.org
[golangtut]:   http://golang.org/doc/code.html
