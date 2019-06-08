class CreateHostnames < ActiveRecord::Migration[6.0]
  def change
    create_table :hostnames do |t|
      t.string :name

      t.timestamps
    end
  end
end
