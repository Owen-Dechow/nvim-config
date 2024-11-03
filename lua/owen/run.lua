function FindCargoToml(filePath)
    local home = os.getenv("HOME")
    local function search(path)
        local cargoFile = path .. '/Cargo.toml'
        -- os.execute returns 0 if the command is successful
        if os.execute('[ -f ' .. cargoFile .. ' ]') == 0 then
            return cargoFile
        else
            local parent = path:match("(.+)/[^/]*$")
            if parent and parent ~= home then
                return search(parent)
            end
        end
        return nil
    end

    return search(filePath)
end

