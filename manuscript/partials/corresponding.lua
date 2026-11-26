-- Build "Corresponding author(s): email1 and email2" for the PDF title block
function Meta(meta)
  local emails = {}
  for _, author in ipairs(meta["by-author"] or {}) do
    if author.attributes and author.attributes.corresponding and author.email then
      local email = pandoc.utils.stringify(author.email)
      table.insert(emails, "\\href{mailto:" .. email .. "}{" .. email .. "}")
    end
  end
  if #emails > 0 then
    local label = #emails > 1 and "Corresponding authors: " or "Corresponding author: "
    meta["corresponding-line"] = pandoc.RawInline("latex", label .. table.concat(emails, " and "))
  end
  return meta
end
