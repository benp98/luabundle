-- Main function of the program
local bundle_manager = import("app/bundle_manager.lua")

return function(args)
    if #args == 1 and args[1] == "-v" then
        print("luabundle v0.01")
        os.exit()
    elseif #args ~= 2 then
        print("usage: luabundle in out")
        os.exit()
    end
    
    local infile = args[1]
    local outfile = args[2]
    local bundle = bundle_manager(infile)
    bundle.process_file(infile, bundle)
    
    bundle.build_bundle(outfile)
end
