return {
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
}
