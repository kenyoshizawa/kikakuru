module MetaTagsHelper
  def default_meta_tags
    {
      site: current_site.name,
      reverse: true,
      title: nil,
      description: current_site.description,
      canonical: request.original_url,
      og: {
        title: :title,
        type: 'website',
        url: request.original_url,
        image: current_site.og_image_url(:ogp),
        site_name: :site,
        description: :description,
        locale: 'ja_JP'
      }
    }
  end
end
