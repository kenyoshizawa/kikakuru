class PlaceUrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # 'valueはhttps://tabelog.com/である'
    if ['https://tabelog.com/'].include?(value)
      record.errors[attribute] << (options[:message] || 'お店の詳細ページのURLを貼り付けてください')

      # unless '都道府県/地域/エリア/レストランIDが適切'
      #   has_error = true unless validate_maximum(record, attribute, value)
      #
      #   record.errors[attribute] << (options[:message] || 'お店の詳細ページのURLを貼り付けてください')
      # else
      #   true
      # end

    elsif 'Map'
      unless '場所の情報が適切'
        record.errors[attribute] << (options[:message] || 'お店の詳細ページのURLを貼り付けてください')
      else
        true
      end

    elsif 'Zoom'
      unless '都道府県/地域/エリア/レストランIDが適切'
        record.errors[attribute] << (options[:message] || 'お店の詳細ページのURLを貼り付けてください')
      else
        true
      end

    else
      record.errors[attribute] << (options[:message] || '以下のリンクから行きたい場所のURLを貼り付けてください')
    end
  end

  def validate_tabelog_url?(str)
    URI.split(str).first == 'https://tabelog.com/' rescue false
  end

  def validate_tabelog_url(record, attribute, value)
    if '都道府県/地域/エリア/レストランIDが適切'
    else
    end
  end
end
