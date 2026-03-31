return {
  {
    -- "vagueframework/vague.nvim",
    "EdenEast/nightfox.nvim",
    lazy = false,    -- Queremos que el tema cargue de primero
    priority = 1000, -- Prioridad máxima
    config = function()
      require("nightfox").setup({
        -- Aquí puedes poner tus opciones personalizadas después
        transparent = true, -- ¡Activa esto para ver el blur de Hyprland!
      })
      vim.cmd("colorscheme carbonfox") -- Cambia "carbonbox" por el nombre del tema que hayas elegido
    end,
  },
}
