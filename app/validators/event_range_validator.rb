class EventRangeValidator < ActiveModel::Validator
  TIME_LOG = 0.0

  # started_atとfinished_atの差が0でない
  def validate(record)
    if (record.finished_at - record.started_at) == TIME_LOG
      # 特定の属性に属さないエラーはbaseに格納する
      record.errors.add(:finished_at, '開始時間と終了時間が同じ時間になっています')
    end
  end
end
