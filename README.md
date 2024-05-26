# Waddle
They aren't called webbed feet for nothing! Yet another web framework.
Molded on top of [ningle](https://github.com/fukamachi/ningle), which in turn is built on
top of [lack](https://github.com/fukamachi/lack) and [clack](http://clacklisp.org/).

> [!WARNING]
> This project is in early development and is unstable in all parts.
> Expect breaking changes.

## Philosophy
Why yet another web framework? There are lots of great options out there, but I always found
myself adding the same set of extensions on top of them. Waddle is opinionated just enough
to eliminate as much boilerplate as possible, while still being flexible for almost all your
web framework needs.

Actions are the base unit of organization, which have a route, method, and matching conditions.
These actions are (optionally) associated with controllers, which (in the future will) provide
common routing prefixes and options. Everything is part of a single application object, stashed
in `*app*`.

## Example

See the [example](example/example.lisp) file. Run by:
```lisp
(asdf:load-system "systems.duck.waddle/example")
(systems.duck.waddle.example:start)
```
Then, access [http://localhost:8080/hello-world](http://localhost:8080/hello-world).
