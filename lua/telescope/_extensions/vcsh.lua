local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local vcshFiles = function(opts)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "Find Files in vcsh",
			finder = finders.new_oneshot_job({ "vcsh", "list-tracked" }, opts),
			sorter = conf.file_sorter(opts),
		})
		:find()
end

return require("telescope").register_extension({
	exports = {
		vcsh = vcshFiles,
	},
})
