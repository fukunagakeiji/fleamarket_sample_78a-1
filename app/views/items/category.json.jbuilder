# JSON形式のデータを配列で返したい場合は、array!を使用.
json.array! @childrens do |child|
  json.id child.id
  json.name child.name
end