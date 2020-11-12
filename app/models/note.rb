class Note < ApplicationRecord
  # associations
  belongs_to :user

  # scopes
  # define scopes for searchable columns
  # example result:
  #   scope :with_title, ->(q) { where(arel_table[:title].matches("%#{q}%")) }
  %i[title body].each do |col|
    scope "with_#{col}".to_sym, ->(q) { where(arel_table[col].matches("%#{q}%")) }
  end

  scope :search, ->(query) {
    with_title(query).or(with_body(query))
  }
  scope :untagged, -> { where(tags: []) }
  scope :with_tags, ->(tags) { where('tags @> ARRAY[:arr]::VARCHAR[]', arr: tags) }

  # validations
  validates :title, presence: true, length: { minimum: 5 }
end
