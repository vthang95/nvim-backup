require('lualine').setup({
  options = {
    theme = 'rose-pine'
  },
  sections = {
    lualine_a = {
      {
        'filename',
        file_status = true,
        path = 1,

        symbols = {
          modified = ' ●',
          readonly = '[x]',
          unnamed = '[No Name]',
          newfile = '[New]',
        }
      },
    },
    lualine_x = {'filetype'}
  },
  tabline = {
    lualine_a = {
      {
        'tabs',
        mode = 2,
        max_length = vim.o.columns * 1.5,
        fmt = function(name, context)
          -- Show + if buffer is modified in tab
          local buflist = vim.fn.tabpagebuflist(context.tabnr)
          local winnr = vim.fn.tabpagewinnr(context.tabnr)
          local bufnr = buflist[winnr]
          local mod = vim.fn.getbufvar(bufnr, '&mod')

          return name .. (mod == 1 and ' ●' or '')
        end
     }
    },
    lualine_c = {
        {
            "navic",
            color_correction = "static",
            navic_opts = { highlight = true },
        },
    }
    --[[ lualine_b = {
      {
        'filename',
        file_status = true,
        path = 1,
        symbols = {
          modified = ' ●',
          readonly = '[x]',
          unnamed = '[No Name]',
          newfile = '[New]',
        }
      },
    }, ]]
  }
})
