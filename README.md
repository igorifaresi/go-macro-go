# go-macro-go

Um sistema simples de macros para Golang.

# Uso

O funcionamento do sistema de macros é bem simples, ele irá escanear um arquivo de nome `macros.gogogo`, que irá conter a descrição das macros do projeto. Cada linha deste arquivo representa uma macro que poderá ser usada no projeto. A descrição deve seguir a seguinte sintaxe:

```
minha_macro::"exit(1)"
```

Exemplo:

```
assert::a[1]"if err != nil {\n"a[1]"\tl.Error(err.Error())\n"a[1]"\tv :="b[1]"\n"a[1]"\tl.Error(v)\n"a[1]"\treturn "b[2]"\n"a[1]"}"
```

O `a[1]` é o recuo que está antes da macro, logo, é possível presertar a identação. E `b` é o vetor de parâmetros da macro, o que veremos mais a seguir. A sintaxe da expressão que vem declarada após os `::` segue a sintaxe do programa `awk`. Basicamente, após processar as macros, a aplicação irá compor um arquivo `awk` que lerá e processará as macros.

Para utilizar o sistema basta baixar o gogogo deste repositório. Após isto, é possível utlizar a aplicação por meio dos comandos:

```
python gogogo my_golang_project run
```

```
python gogogo my_golang_project build
```

# Sintaxe

```go
import (
  . "github.com/igorifaresi/jda/waiter"
)

func main() {
  POST("/", func(ctx Context) Dish {
    l := ctx.Logger
    
    name, err := GetQueryParameter(ctx, "name")
    %%assert "name required";InternalError(v)
    
    return Success("OK")
  })
}
```

A sintaxe se baseia em o nome da macro preceido de `%%` e os parâmetros separados por `;`.
Neste caso a macro será expandida para:

```go
import (
  . "github.com/igorifaresi/jda/waiter"
)

func main() {
  POST("/", func(ctx Context) Dish {
    l := ctx.Logger
    
    name, err := GetQueryParameter(ctx, "name")
    if err != nil {
      l.Error(err.Error())
      v := l.Error("name required")
      l.ErrorQueue.Dump()
      return InternalError(v)
    }
    
    return Success("OK")
  })
}
```
