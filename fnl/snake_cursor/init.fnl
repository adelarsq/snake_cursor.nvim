(local M {})

(localfunction Snake ()
    (vim.cmd "highlight Snake1 cterm=bold gui=bold guibg=#c1f5a7")

    (local bufnr (vim.api.nvim_get_current_buf))
    (let [[row col] (unpack (vim.api.nvim_win_get_cursor 0))]
        (if (or (< row 1) (< col 0))
            (return))

        (local ns_id (vim.api.nvim_buf_add_highlight bufnr 0 "Snake1" (- row 1) col (+ col 1)))

        (localfunction bufferExists (bufnrarg)
            (local buf_list (vim.api.nvim_list_bufs))
            (for [_ buf (ipairs buf_list)]
                (if (== buf bufnrarg)
                    (return true)))
            (return false))

        (localfunction reset_snake ()
            (if (bufferExists bufnr)
                (vim.api.nvim_buf_clear_namespace bufnr ns_id (- row 1) row)))

        (vim.defer_fn reset_snake 1000)))

(localfunction M.setup ()
    (vim.api.nvim_create_autocmd {"CursorMoved" "CursorMovedI"} {:callback Snake}))

(return M)

