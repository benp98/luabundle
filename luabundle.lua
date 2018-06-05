-- Entry point of the program.
-- Only basic stuff is set up here, the actual program is in app/main.lua
local args = {...}

-- Check if we are already bundled
if import == nil then
    dofile("util/loader.lua")
end

import("app/main.lua")(args)
