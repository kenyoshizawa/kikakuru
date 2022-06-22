class PlaceFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    googlemap_url = %w(
      https://www.google.co.jp/maps/place/
      https://goo.gl/maps/
    )

    unless value.start_with?(*googlemap_url)
      record.errors[attribute] << (options[:message] || 'を貼り付けてください')
    end
  end
end
