--[[
    configparser
    Configuration Parser
    twix.cyou/pix

    Author: ttwiz_z (ttwizz)
    License: MIT
    GitHub: https://github.com/ttwizz/configparser
]]


return function(Input, Output)
    assert(type(Input) == "string", "Argument 1 (Input) must be a string")

    Output = type(Output) == "table" and Output or {}

    for Key, Value in string.gmatch(Input, "%s*(.-)%s*:%s*(.-)%s*\n") do
        if string.lower(Value) == "nil" or string.lower(Value) == "null" or string.lower(Value) == "none" or string.lower(Value) == "nothing" or string.lower(Value) == "undefined" then
            Output[Key] = nil
        elseif string.lower(Value) == "true" then
            Output[Key] = true
        elseif string.lower(Value) == "false" then
            Output[Key] = false
        elseif tonumber(Value) then
            Output[Key] = tonumber(Value)
        else
            Output[Key] = Value
        end
    end

    return Output
end