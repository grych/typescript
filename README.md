# TypeScript

The library to compile the TypeScript to JavaScript. This library contains a File System, to watch
the changes to the *.ts file in a directory called "ts/", and compile it to the JavaScript after
any change inside it.

The **TypeScript** is **only available for Mac**, the Linux and Windows version are coming. If you have
it, please contact me at my email: <grych@tg.pl>.

## Installation

The package can be installed by adding `typescript` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:typescript, "~> 0.2.2"}
  ]
end
```

### Mac version

#### Install node via brew

Install the **node**, **npm** and **npx**:

```bash
brew install node
```


#### Install npm globally

Install the **tsc** globally:

``` bash
npm install -g typescript
```

## Documentation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). The docs can
be found at <https://hexdocs.pm/typescript>.

## Contact

(c)2025 Tomasz "Grych" Gryszkiewicz,
<grych@tg.pl>
