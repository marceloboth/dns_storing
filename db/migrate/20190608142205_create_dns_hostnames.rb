class CreateDnsHostnames < ActiveRecord::Migration[6.0]
  def change
    create_table :dns_hostnames do |t|
      t.references :dns, null: false, foreign_key: true, index: true
      t.references :hostname, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
