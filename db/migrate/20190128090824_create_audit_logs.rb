class CreateAuditLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :audit_logs do |t|
      t.json :log
      t.references :audit_logable, polymorphic: true

      t.timestamps
    end
  end
end
