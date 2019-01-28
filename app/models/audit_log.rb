class AuditLog < ApplicationRecord
  belongs_to :audit_logable, polymorphic: true
  serialize :log, Hash
  validates :log, presence: true

  def data
    OpenStruct.new(self.log)
  end

end
