module M
  def i18n_value
    I18n.t(".masters.#{self.class.name.demodulize.tableize}.#{name}", locale: :vi)
  end

  class << self
    def table_name_prefix
      "m_"
    end
  end
end
