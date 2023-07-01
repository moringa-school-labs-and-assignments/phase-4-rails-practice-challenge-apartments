class AddTenantIdToLeases < ActiveRecord::Migration[6.1]
  def change
    add_reference :leases, :tenant, null: false, foreign_key: true
  end
end
