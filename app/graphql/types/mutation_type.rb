module Types
  class MutationType < Types::BaseObject
    feild :create_image, mutation: Mutations::CreateImage
  end
end
