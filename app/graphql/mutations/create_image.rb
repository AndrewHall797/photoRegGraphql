class Mutations::CreateImage < Mutations::BaseMutation

    argument :title, String, required: true
    argument :description, String, required: true
    argument :location, String, required: true
    argument :tags, [String], required: false
    argument :image, ApolloUploadServer::Upload, required: true

    field  :image, Types::ImageType, null:false
    field  :errors, [String], null: true

    def resolve(input)
      user = context[:current_user]
      file = input[:image]
      blob = ActiveStorage::Blob.create_and_upload!(
          io: file,
          filename: file.original_filename,
          content_type: file.content_type
      )
      image = Image.new(title: input[:title],description: input[:description],location: input[:location], image: blob, user: user)

      if image.save
        if input[:tags]
          for tag_name in input[:tags] do
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
          errors: image.errors.full_messages
        }
      end
    end
end
