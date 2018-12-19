module Loaders
  class AssociationLoader < GraphQL::Batch::Loader
    def initialize(association_name)
      @association_name = association_name
    end

    private

    def perform(records)
      ::ActiveRecord::Associations::Preloader.new.preload(records, @association_name)
      records.each { |record| fulfill(record, record.public_send(@association_name)) }
    end
  end
end