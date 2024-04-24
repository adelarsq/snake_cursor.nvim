local M = {}

function Snake()
    vim.cmd([[highlight Snake1 cterm=bold gui=bold guibg=#c1f5a7 ]])

    local bufnr = api.nvim_get_current_buf()

    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    -- print("row = " .. row .. " - col " .. col)

    if row < 1 or col < 1 then
        return
    end

    local ns_id = api.nvim_buf_add_highlight(bufnr, 0, 'Snake1', row-1, col, col+1)

    local function bufferExists(bufnrarg)
        local buf_list = vim.api.nvim_list_bufs()
        for _, buf in ipairs(buf_list) do
            if buf == bufnrarg then
                return true
            end
        end
        return false
    end

    local function reset_snake()
        if bufferExists(bufnr) then
            api.nvim_buf_clear_namespace(bufnr, ns_id, row-1, row)
        end
    end

    -- Schedule the reset function to be called after 1000 ms
    vim.defer_fn(reset_snake, 1000)
end


function M.setup()
    local autocmd = vim.api.nvim_create_autocmd

    autocmd({ 'CursorMoved' }, {
        callback = Snake
    })
end

return M
