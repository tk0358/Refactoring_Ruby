def product_count_items(search_criteria)
  ProductCountItem.find_all_by_criteria(search_criteria)
end