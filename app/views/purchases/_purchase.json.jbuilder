json.(purchase.purchase_option, :id, :price, :quality)
json.content do
  json.partial! purchase.content
end
