local M = {}

function M.cmake_generate()
	if vim.fn.executable("cmake") == 0 then
		print("cmake not found")
		return
	end
	-- create build dir
	if vim.fn.isdirectory("build") == 0 then
		vim.fn.mkdir("build")
	end
	-- generate build files
	local gen_result
	if vim.fn.has("win32") == 1 then
		gen_result = vim.fn.system('cmake -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -S . -B build -G "MinGW Makefiles"')
	else
		gen_result = vim.fn.system("cmake -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -S . -B build")
	end
	print(vim.inspect(gen_result))
end

return M
