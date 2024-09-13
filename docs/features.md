# Features

## Code blocks
```python title="Calculator Enum"
def test_function(value: str) -> None:
    print(value)
```

## Import source files
```python title="Hello"
--8<-- "src/python_project_template/__init__.py:hello"
```

## Admonition
/// tip | Did you know?
Did you know you can use different types of admonitions, such as note, attention, caution, danger, error, tip, hint, warning.
///

/// warning | Dont forget!
Don't forget to read above!
///

## Definitions
/// define
Apple

- Pomaceous fruit of plants of the genus Malus in
  the family Rosaceae.

Banana

- Delicious yellow fruit.

///

## Details

/// details | Some summary
    type: warning

Some content
///

/// details | Some summary
    type: hint
    open: true

It is also possible to have them open by default!
///

## Tabbed
=== "Tab 1"
    Markdown **content**.

    Multiple paragraphs.

=== "Tab 2"
    More Markdown **content**.

    - list item a
    - list item b

## Links
[Internal links](index.md)

[External links](https://www.toolsense.io)