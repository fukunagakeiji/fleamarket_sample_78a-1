# JSON形式のデータを配列で返したい場合は、array!を使用。
# 子カテゴリーのデータを返す
json.array! @childrens do |child|
  json.id child.id
  json.name child.name
end

# 孫カテゴリーのデータを返す
json.array! @grandChilds do |grandchild|
  json.id grandchild.id
  json.name grandchild.name
end