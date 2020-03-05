module Search
  class ArticleSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :approved, :body_text, :class_name, :cloudinary_video_url,
               :comments_count, :experience_level_rating, :experience_level_rating_distribution,
               :featured, :featured_number, :flare_tag, :hotness_score, :language,
               :main_image, :path, :positive_reactions_count, :published,
               :published_at, :quote, :reactions_count, :readable_publish_date,
               :reading_time, :score, :search_score, :subtitle, :summary, :title,
               :video_duration_in_minutes, :website_url

    attribute :tags do |article|
      article.tags.map do |tag|
        { name: tag.name, keywords_for_search: tag.keywords_for_search }
      end
    end

    attribute :user do |article|
      NestedUserSerializer.new(article.user).serializable_hash.dig(
        :data, :attributes
      )
    end

    attribute :organization do |article|
      {
        slug: article.organization. slug,
        name: article.organization.name,
        id: article.organization.id,
        profile_image_90: article.organization.profile_image_90
      }
    end
  end
end
