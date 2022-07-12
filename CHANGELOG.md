Changelog
============

This is a high-level changelog for each released versions of the plugin.
For a more detailed list of past and incoming changes, see the commit history.

Master
------
- Fix .get_meta() would spam Output Errors if object was not a `Dataclass`
- Fix empty dictionary would print on multiple lines if `print_newline` was enabled

1.0.2
------
- Improve printing of Dataclass (recursive algorithm)
- Exclude properties from being printed by using `print_exclude` option
  
1.0.1
------
- Sort properties by name alphabetically
- Added quotes when printing string properties
- from_dict: Skips keys not in Object
- from_dict: Type check skips if either expected or received is one of [`TYPE_INT`, `TYPE_FLOAT`]

1.0.0
------
- Initial Release