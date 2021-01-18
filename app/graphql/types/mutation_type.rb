module Types
  class MutationType < Types::BaseObject
    field :create_image, mutation: Mutations::CreateImage
  end
end
