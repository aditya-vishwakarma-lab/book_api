ThinkingSphinx::Index.define :book, :with => :active_record do
  indexes title
  indexes author
  indexes description

  has  language, created_at, updated_at
end