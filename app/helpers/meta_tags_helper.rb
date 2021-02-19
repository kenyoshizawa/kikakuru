module MetaTagsHelper
  def default_meta_tags
    {
      site: 'kikakuru',
      reverse: true,
      title: nil,
      description: 'description',
      canonical: request.original_url,
      og: {
        title: :title,
        type: 'website',
        url: request.original_url,
        image: 'https://example.com/hoge.png',
        site_name: :site,
        description: :description,
        locale: 'ja_JP'
      }
    }
  end
end
