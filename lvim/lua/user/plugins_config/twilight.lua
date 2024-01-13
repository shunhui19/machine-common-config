local M = {}

M.config = function()
    local status_ok, twilight = pcall(require, "twilight")
    if not status_ok then
        return
    end

    twilight.setup {
        dimming = {
            alpha = 0.25, -- amount of dimming
            color = { "Normal", "#7d7474" },
        },
        context = 15,
        expand = {
            "function",
            "method",
            "table",
            "if_statement",
        },
        exclude = {},
    }
end

return M
