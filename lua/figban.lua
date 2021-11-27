local api = vim.api

--[[
-- Begin definition of comment patterns
--]]
comment_formats = {}
comment_formats["default"] = {"# ", "# ", "# "}
comment_formats["ansible"] = {"# ", "# ", "# "}
comment_formats["apache"] = {"# ", "# ", "# "}
comment_formats["apachestyle"] = {"# ", "# ", "# "}
comment_formats["asciidoc"] = {"//// ", "     ", "////"}
comment_formats["awk"] = {"# ", "# ", "#"}
comment_formats["c"] = {"/** ", " *  ", "**/"}
comment_formats["django"] = {"{% comment %} ", " ", "{% endcomment %"}
comment_formats["dockerfile"] = {"# ", "# ", "#"}
comment_formats["go"] = {"/** ", " *  ", "**/"}
comment_formats["groovy"] = {"/** ", " *  ", "**/"}
comment_formats["html"] = {"<-- ", "--  ", "-->"}
comment_formats["java"] = {"/** ", " *  ", "**/"}
comment_formats["javascript"] = {"/** ", " *  ", "**/"}
comment_formats["jinja"] = {"{# ", "  ", "#}"}
comment_formats["jsonnet"] = {"/** ", " *  ", "**/"}
comment_formats["lua"] = {"--[[ ", "--   ", "--]]"}
comment_formats["nginx"] = {"# ", "# ", "#"}
comment_formats["perl"] = {"# ", "# ", "#"}
comment_formats["php"] = {"/** ", " *  ", "**/"}
comment_formats["plsql"] = {"/** ", " *  ", "**/"}
comment_formats["ps1"] = {"# ", "# ", "#"}
comment_formats["python"] = {'""" ', "    ", '"""'}
comment_formats["ruby"] = {"# ", "# ", "#"}
comment_formats["rust"] = {"/** ", " *  ", "**/"}
comment_formats["sh"] = {"# ", "# ", "#"}
comment_formats["sql"] = {"/** ", " *  ", "**/"}
comment_formats["terraform"] = {"/** ", " *  ", "**/"}
comment_formats["yaml"] = {"# ", "# ", "#"}
comment_formats["vim"] = {"\" ", "\" ", "\""}
comment_formats["zsh"] = {"# ", "# ", "#"}
--[[
-- End definition of comment patterns
--]]

-- get_comment_format get the comment format according to the type of file
-- return: the good format (table)
function get_comment_format()
	local filetype = vim.bo.filetype
	if comment_formats[filetype] ~= nil then
		return comment_formats[filetype]
	else
    return comment_formats["default"]
	end
end

-- rtrim trim the right of the given string
-- return: the trimmed string
function rtrim(s)
  return s:match "(.-)%s*$"
end

--[[
-- Begin FigBan class declaration
--]]
local FigBan = {}
FigBan.__index = FigBan

function FigBan.new(text)
  local self = setmetatable({}, FigBan)
	self.font_style = vim.g.figban_fontstyle or "standard"
  self.format = get_comment_format()
	self.text = text
	self.banner = ""
  return self
end

function FigBan.generate(self)
	local banner = {}
  local handler = assert(io.popen("figlet -f " .. self.font_style .. " " .. self.text))


	local line = handler:read("*l")
	repeat
		local next_line = handler:read("*l")
	  if #banner == 0 then
	    table.insert(banner, rtrim(self.format[1] .. line))
		elseif next_line ~= nil then
	    table.insert(banner, rtrim(self.format[2] .. line))
		else
			if rtrim(line) ~= "" then
				table.insert(banner, rtrim(self.format[2] .. line))
			end
		  table.insert(banner, rtrim(self.format[3]))
		end

		line = next_line
	until line == nil

	if handler then handler:close() end
	self.banner = banner
end

function FigBan.print(self)
	api.nvim_put(self.banner, "l", true, true)
end
--[[
-- End FigBan class declaration
--]]

function figban(text)
  local figban = FigBan.new(text)
  figban:generate()
	figban:print()
end

return {
  figban = figban
}
