require "csv"
module MasterImporter
  class MasterImporter::CSVImporter
    def initialize model
      @model = model
    end

    def execute
      destroy_all
      CSV.foreach(csv_file_path, headers: true) do |row|
        instance = model.new
        row.to_hash.each{|key, value| instance[key] = value}
        instance.save!
      end
    end

    private
    attr_reader :model

    def destroy_all
      model.destroy_all
    end

    def csv_file_path
      Rails.root.join "db", "masters", "#{model.name.underscore.pluralize}.csv"
    end
  end
end
