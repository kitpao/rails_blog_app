class Article < ApplicationRecord
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings

    # def tag_list
    #   self.tags.collect do |tag|
    #     tag.name
    #   end.join(", ")
    # end

    def tag_list=(tags_string)
      tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
      #looking in the DB
      new_or_found_tags = tag_names.collect do |tag_name|
        Tag.find_or_create_by(name: tag_name)
      end
      #attach_to_article
      self.tags = new_or_found_tags
    end

    def tag_list
        tags.join(", ")
    end
end
