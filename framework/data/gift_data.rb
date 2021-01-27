class GiftData
  def self.commercial_workspace_list_type
    {
      three_month: '$44',
      six_month: '$84',
      year: '$164'
    }
  end

  def self.brands_info
    @brands_info ||= JSON.parse(File.read("#{__dir__}/brands_and__fragrances.json"))
  end
end
