local M = {
	"RaafatTurki/hex.nvim",
	cmd = { "HexDump", "HexAssemble", "HexToggle" },
}

function M.config()
	require("hex").setup()
end

return M
