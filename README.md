# go-macro-go

A simple macro system for avoid repetive writing, of course, this have to be used for right porpouses and with moderation.

## Syntax

```go
%%mymacro "a";"b";42
```

## Usage

For while, the script is not checking `GOPATH` for get real golang projects folder. In my machine `GOPATH` points to my home folder, then I hard coded the gopath value in script for my home path.
