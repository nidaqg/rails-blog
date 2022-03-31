#every new class will inheret from ApplicationRecord which is what that syntax means
class Article < ApplicationRecord
belongs_to :user
has_many :article_categories
has_many :categories, through: :article_categories
validates :title, presence: true, length: {minimum: 2, maximun: 100}
validates :description, presence: true, length: {minimum: 10, maximum: 300}
end