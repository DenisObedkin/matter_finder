# frozen_string_literal: true

class Matter < ApplicationRecord
  extend Pagy::Searchkick

  has_many :versions

  validates :title, :text, presence: { message: 'Не может быть пустым' }
  validates :author, presence: { message: 'Не может быть без автора' }

  after_commit :save_prev_version, if: :persisted?

  # Searchkick
  searchkick word_start: %i[title], callbacks: :async


  def search_data
    {
      title: title,
      text: text,
      author: author,
      updated_at: updated_at
    }
  end

  private

  def save_prev_version
    new_version = Hash.new

    self.previous_changes.each do |key, changes|
      new_version[key] = changes.last
    end

    self.versions.create!(version: new_version.to_json)
  end
end
