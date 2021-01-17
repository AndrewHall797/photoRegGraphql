class Mutations::CreateImage < Mutations::BaseMutation

    argument :title, String, required: true
    argument :description, String, required: true
    argument :location, String, required: true
    argument :tags, [String], requied: false
    argument :image, ApolloUploadServer::Upload, required: true

    feild :image, Types::ImageType, null:false
    field :errors, [String], null: true  

    def resolve(title:, description:, location:, image:, tags:)
      file = :image
      blob = ActiveStorage::Blob.create_and_upload!(
          io: file,
          filename: file.original_filename,
          content_type: file.content_type
      )
      image = Image.new(title, description, location, image)

      if image.save
        user.images << image
        if tags
          for tag_name in params[:tags] do
            if (tag = Tag.find_by(tag_title: tag_name)) == nil
              tag = Tag.create!(tag_title: tag_name)
            image.tags << tag
            end
          end
        end
        {
          image: image
        }
      else
        {
          errors: image.errors.full_message
        }
      end
    end
end
