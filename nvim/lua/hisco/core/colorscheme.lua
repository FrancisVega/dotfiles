local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
	print("Color schema not found")
end
