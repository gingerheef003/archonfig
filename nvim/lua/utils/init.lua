local M = {}

function M._echo_multiline(msg)
  for _, s in ipairs(vim.fn.split(msg, "\n")) do
    vim.cmd("echom '" .. s:gsub("'", "''") .. "'")
  end
end

function M.info(msg)
  vim.cmd("echohl Directory")
  M._echo_multiline(msg)
  vim.cmd("echohl None")
end

function M.warn(msg)
	vim.cmd("echohl WarningMsg")
	M._echo_multiline(msg)
	vim.cmd("echohl None")
end

function M.err(msg)
	vim.cmd("echohl ErrorMsg")
	M._echo_multiline(msg)
	vim.cmd("echohl None")
end

M.sudo_exec = function (cmd, print_output)
	vim.fn.inputsave()
	local password = vim.fn.inputsecret("Password: ")
	vim.fn.inputrestore()
	if not password or #password == 0 then
		M.warn("Invalid password, sudo aborted")
		return false
	end
	local out = vim.fn.system(string.format("sudo -p '' -S %s", cmd), password)
	if vim.v.shell_error ~= 0 then
		print("\r\n")
		M.err(out)
		return false
	end
	if print_output then print("\r\n", out) end
	return true
end

M.sudo_write = function (tmpfile, filepath)
	if not tmpfile then tmpfile = vim.fn.tempname() end
	if not filepath then filepath = vim.fn.expand("%") end
	if not filepath or #filepath == 0 then
		print("E32: No file name")
		return
	end

	local cmd = string.format("dd if=%s of=%s bs=1048576",
		vim.fn.shellescape(tmpfile),
		vim.fn.shellescape(filepath))
	
		vim.api.nvim_exec(string.format("write! %s", tmpfile), true)
		if M.sudo_exec(cmd) then
			M.info(string.format("\r\n'%s' written", filepath))
			vim.cmd("e!")
		end
		vim.fn.delete(tmpfile)
end

return M