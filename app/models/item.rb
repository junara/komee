# frozen_string_literal: true

class Item < ApplicationRecord
  has_rich_text :content
  has_one_attached :image
  has_secure_token :token
  validates :message, length: { minimum: 1, maximum: 20, too_long: '簡潔に！', too_short: 'メッセージ頂戴！' }

  def resize_image(width = 500, height = 500)
    variation = ActiveStorage::Variation.new(
      Uploads.resize_to_fit(width: width, height: height, blob: image.blob, message: message)
    )
    ActiveStorage::Variant.new(image.blob, variation)
  end
end
