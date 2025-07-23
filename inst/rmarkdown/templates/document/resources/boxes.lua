function Div (div)
  -- Extract the custom title from attributes if it exists
  local custom_title = div.attributes.name

  if div.classes:includes('notebox') then
    local begin_env = '\\begin{notebox}'
    if custom_title then
      begin_env = '\\begin{notebox}[' .. custom_title .. ']'
    end
    return pandoc.List { pandoc.RawBlock('latex', begin_env) } ..
           div.content ..
           pandoc.List { pandoc.RawBlock('latex', '\\end{notebox}') }

  elseif div.classes:includes('warningbox') then
    local begin_env = '\\begin{warningbox}'
    if custom_title then
      begin_env = '\\begin{warningbox}[' .. custom_title .. ']'
    end
    return pandoc.List { pandoc.RawBlock('latex', begin_env) } ..
           div.content ..
           pandoc.List { pandoc.RawBlock('latex', '\\end{warningbox}') }

  elseif div.classes:includes('importantbox') then
    local begin_env = '\\begin{warningbox}'
    if custom_title then
      begin_env = '\\begin{warningbox}[' .. custom_title .. ']'
    end
    return pandoc.List { pandoc.RawBlock('latex', begin_env) } ..
           div.content ..
           pandoc.List { pandoc.RawBlock('latex', '\\end{warningbox}') }

  elseif div.classes:includes('ideabox') then
    local begin_env = '\\begin{ideabox}'
    if custom_title then
      begin_env = '\\begin{ideabox}[' .. custom_title .. ']'
    end
    return pandoc.List { pandoc.RawBlock('latex', begin_env) } ..
           div.content ..
           pandoc.List { pandoc.RawBlock('latex', '\\end{ideabox}') }

  elseif div.classes:includes('examplebox') then
    local begin_env = '\\begin{examplebox}'
    if custom_title then
      begin_env = '\\begin{examplebox}[' .. custom_title .. ']'
    end
    return pandoc.List { pandoc.RawBlock('latex', begin_env) } ..
           div.content ..
           pandoc.List { pandoc.RawBlock('latex', '\\end{examplebox}') }
  end
end
