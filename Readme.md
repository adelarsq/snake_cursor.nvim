# Snake Cursor for Neovim

Neovim plugin that turns your cursor into a snake while moving the cursor on the text (using hjkl or others):

![image](https://github.com/adelarsq/snake_cursor.nvim/assets/430272/c99d6ff7-d3bd-41b1-9de5-6f0d9083ec67)

## Installing

### Plug

```
Plug 'https://github.com/adelarsq/snake_cursor.nvim'
```

### Lazy

```lua
{
    'https://github.com/adelarsq/snake_cursor.nvim',
    event = 'VeryLazy',
    config = function()
        require("snake_cursor").setup()
    end
},
```
