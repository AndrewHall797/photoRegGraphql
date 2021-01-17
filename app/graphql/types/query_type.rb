module Types
  class QueryType < Types::BaseObject
    field :all_images, [Types::ImageType], null: false
    field :all_users, [Types::UserType], null: false
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    def all_images
      Image.all
    end

    def all_users
      User.all
    end

  end
end
