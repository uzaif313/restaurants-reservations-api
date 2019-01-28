module AuditLogable
  extend ActiveSupport::Concern

  included do
    has_many :audits, as: :audit_logable, class_name: 'AuditLog'
    after_save :create_audit
  end

  def prev
    self.audits.last(2)&.first
  end

  private
    def create_audit
      AuditLog.create!(log: self.as_json, audit_logable:self)
    end
end
