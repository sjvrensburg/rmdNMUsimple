function Div (div)
  if div.classes:includes('note') then
    return pandoc.List { pandoc.RawBlock('latex', '\\begin{notebox}') } ..
           div.content ..
           pandoc.List { pandoc.RawBlock('latex', '\\end{notebox}') }
  elseif div.classes:includes('warning') then
    return pandoc.List { pandoc.RawBlock('latex', '\\begin{warningbox}') } ..
           div.content ..
           pandoc.List { pandoc.RawBlock('latex', '\\end{warningbox}') }
  elseif div.classes:includes('example') then
    return pandoc.List { pandoc.RawBlock('latex', '\\begin{examplebox}') } ..
           div.content ..
           pandoc.List { pandoc.RawBlock('latex', '\\end{examplebox}') }
  end
end
