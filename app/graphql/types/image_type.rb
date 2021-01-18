module Types
  class ImageType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :description, String, null: true
    field :location, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer, null: false
    field :tags, [Types::TagType], null: false
    field :image_blob_path, String, null: false

    def image_blob_path
      Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
    end

  end
end
