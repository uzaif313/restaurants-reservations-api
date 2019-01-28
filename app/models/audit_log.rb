class AuditLog < ApplicationRecord
  belongs_to :audit_logable, polymorphic: true
  serialize :log, Hash
  validates :log, presence: true

  def data
    Struct.new(self.log)
  end

end
