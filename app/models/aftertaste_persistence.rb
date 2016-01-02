class AftertastePersistence < ActiveRecord::Base
  belongs_to :analysis_conclusion

  enum nature: [:acid, :tannin, :alcohol, :drying, :herbaceous]
end
