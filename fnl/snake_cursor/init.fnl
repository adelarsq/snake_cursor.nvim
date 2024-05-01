(local M {})

(set-forcibly! Snake (fn []
    (vim.cmd "highlight Snake1 cterm=bold gui=bold guibg=#c1f5a7 ")
    
    (local bufnr (vim.api.nvim_get_current_buf))

    (local (row col)
            (unpack (vim.api.nvim_win_get_cursor 0)))

    (when (or (< row 1) (< col 0)) (lua "return "))

    (local ns-id
            (vim.api.nvim_buf_add_highlight bufnr 0 :Snake1
                                            (- row 1) col
                                            (+ col 1)))

    (fn buffer-exists [bufnrarg]
        (let [buf-list (vim.api.nvim_list_bufs)]
        (each [_ buf (ipairs buf-list)]
            (when (= buf bufnrarg) (lua "return true")))
        false))

    (fn reset-snake []
        (when (buffer-exists bufnr)
        (vim.api.nvim_buf_clear_namespace bufnr ns-id
                                            (- row 1) row)))

    (vim.defer_fn reset-snake 1000)))

(fn M.setup []
  (vim.api.nvim_create_autocmd [:CursorMoved :CursorMovedI] {:callback _G.Snake}))

M	

