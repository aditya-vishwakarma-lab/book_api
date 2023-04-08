ThinkingSphinx::Index.define :book, :with => :real_time do
  indexes title
  indexes author
  indexes description
end