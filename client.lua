local cacheHandles = {}

local GetGamePool = GetGamePool
local CreateThread = CreateThread
local Wait = Wait
local GetEntityModel = GetEntityModel
local SetEntityAsMissionEntity = SetEntityAsMissionEntity
local DeleteEntity = DeleteEntity
local GetEntityCoords = GetEntityCoords
local FreezeEntityPosition = FreezeEntityPosition
local cObject = 'CObject'

local function FreezeObject(handle)
    FreezeEntityPosition(handle, true)
end

local function DeleteObject(handle)
    SetEntityAsMissionEntity(handle, true, true)
    DeleteEntity(handle)
end

local function CheckObject(data, handle)
    for _, metadata in pairs(data) do
        if metadata.mode == FREEZE then
            if metadata.pos then
                local objCoord = GetEntityCoords(handle)
                for _, vector in pairs(metadata.pos) do
                    if #(objCoord - vector) < 0.1 then
                        FreezeObject(handle)
                        break
                    end
                end
            else
                FreezeObject(handle)
            end
        elseif metadata.mode == DELETE then
            if metadata.pos then
                local objCoord = GetEntityCoords(handle)
                for _, vector in pairs(metadata.pos) do
                    if #(objCoord - vector) < 0.1 then
                        DeleteObject(handle)
                        break
                    end
                end
            else
                DeleteObject(handle)
            end
        end
    end
end

CreateThread(function()
    while true do
        local newCacheHandles = {}
        for _, handle in pairs(GetGamePool(cObject)) do
            newCacheHandles[handle] = true

            if cacheHandles[handle] then
                goto nextObject
            end

            local datas = Config.props[GetEntityModel(handle)]
            if datas then
                CheckObject(datas, handle)
            end

            ::nextObject::
        end

        cacheHandles = newCacheHandles
        Wait(500)
    end
end)
