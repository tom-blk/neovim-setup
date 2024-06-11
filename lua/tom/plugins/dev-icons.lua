return {
    'nvim-tree/nvim-web-devicons',

    config = function()
        local icons = require("nvim-web-devicons") 
        
        icons.setup({
            -- globally enable different highlight colors per icon (default to true)
            -- if set to false all icons will have the default icon's color
            color_icons = true;
            -- globally enable default icons (default to false)
            -- will get overriden by `get_icons` option
            default = true;
            -- globally enable "strict" selection of icons - icon will be looked up in
            -- different tables, first by filename, and if not found by extension; this
            -- prevents cases when file doesn't have any extension but still gets some icon
            -- because its name happened to match some extension (default to false)
            strict = true;
		})
        
        icons.get_icons_by_filename()
        icons.get_icons_by_extension()
        icons.get_icons_by_operating_system()
        icons.get_icons_by_desktop_environment()
        icons.get_icons_by_window_manager()
    end,

}
