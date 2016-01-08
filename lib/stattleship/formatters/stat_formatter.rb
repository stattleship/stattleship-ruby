module Stattleship
  class StatFormatter
    def self.format(value:, precision: 0)
      if value
        value.to_d.to_f.round(precision)
      else
        ''
      end
    end

    def self.stat(stat_name:, value:)
      if stat_name.nil? || value.nil?
        return ''
      end

      if stat_name.end_with?('average') ||
         stat_name.end_with?('avg') ||
         stat_name.end_with?('pct') ||
         stat_name.end_with?('percentage')
        self.format(value: value, precision: 3)
      elsif stat_name.end_with?('rating')
        self.format(value: value, precision: 5)
      else
         self.format(value: value)
      end
    end
  end
end
