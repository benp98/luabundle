-- Class for collecting the file's content and building a bundle file
local source_parser = import("app/source_parser.lua")

return function(entry_point)
    local self = {}
    local files = {}
    
    -- Searches the given file recursively for import function calls
    self.process_file = function(filename)
        local parser = source_parser(filename)
        files[filename] = parser.content
        
        for _, f in pairs(parser.includes) do
            self.process_file(f)
        end
    end
    
    -- Create a bundle file which contains the detected files
    self.build_bundle = function(dest_file)
        local file = io.open(dest_file, "w")
        
        file:write("(function(args)\n")
        file:write("local modules = {}\n")
        
        -- Create a sorted list of keys so the output will be the same when the input does not change
        local filenames = {}
        for filename, _ in pairs(files) do
            table.insert(filenames, filename)
        end
        table.sort(filenames)
        
        -- Add files as modules
        for _, filename in pairs(filenames) do
            file:write("modules['")
            file:write(filename)
            file:write("'] = function(...)\n")
            file:write(files[filename])
            file:write("end\n")
        end
        
        file:write("function import(n)\n")
        file:write("return modules[n](table.unpack(args))\n")
        file:write("end\n")
        
        file:write("local entry = import('" .. entry_point .. "')\n")
        
        file:write("end)({...})")
        file:flush()
        file:close()
    end
    
    return self
end
