-- Utility function for having a working import function
-- Feel free to use it in your own projects
(function()
    local script_cache = {};
    function import(name)
        if script_cache[name] == nil then
            script_cache[name] = loadfile(name)
        end
        
        if script_cache[name] ~= nil then
            return script_cache[name]()
        end
        error("Failed to load script " .. name)
    end
end)()
