module Types
  class TagType < Types::BaseObject
    field :id, ID, null: false
    field :tag_title, String, null: true
    field :images, [Types::ImageType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
