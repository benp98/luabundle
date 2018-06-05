# luabundle
A tool for bundling lua files into a single, easy distributable file. It can bundle itself.

## Usage
"Modules" are imported by calling the import() function. The name of the module must be a relative path from the project's root directory enclosed in double quotes.

```lua
local another_module = import("another_module.lua")
```

A bundle is created by running the luabundle.lua file with the input and the output files as arguments.

## License
License information is in the file [LICENSE](LICENSE).
