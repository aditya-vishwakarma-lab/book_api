class Book < ApplicationRecord
  ThinkingSphinx::Callbacks.append(
    self, :behaviours => [:real_time]
  )

  # def self.search_query(query)
  #   Rails.cache.fetch(expires_in: 7.days) do
  #     Book.search(query)
  #   end
  # end

  # def book_search
  #   Rails.cache.fetch("#{cache_key_with_version}", expires_in: 7.days) do
  #     Book.search(params[:query_attribute])
  #   end
  # end
end
