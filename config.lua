FREEZE       = 0
DELETE       = 1

Config       = {}
Config.props = {
    -- [`prop_mineshaft_door`]      = {
    --     {
    --         mode = DELETE, -- Delete at specified coords
    --         pos = {
    --             vector3(-596.00, 2088.00, 130.00)
    --         },
    --     },
    --     {
    --         mode = FREEZE, -- Freeze everywhere else
    --     },
    -- },

    [`prop_mineshaft_door`]      = { { mode = DELETE } }, -- Mine doors
    [`prop_sec_barrier_ld_01a`]  = { { mode = DELETE } }, -- Parkings barrier
    [`prop_sec_barier_base_01`]  = { { mode = DELETE } }, -- Parkings barrier
   
    -- Gas pumps (Avoid vehicles to desync and break gas pumps, can be destroyed by pistols)
    [`prop_gas_pump_old2`]       = { { mode = FREEZE } },
    [`prop_gas_pump_1a`]         = { { mode = FREEZE } },
    [`prop_vintage_pump`]        = { { mode = FREEZE } },
    [`prop_gas_pump_old3`]       = { { mode = FREEZE } },
    [`prop_gas_pump_1c`]         = { { mode = FREEZE } },
    [`prop_gas_pump_1b`]         = { { mode = FREEZE } },
    [`prop_gas_pump_1d`]         = { { mode = FREEZE } },
}
