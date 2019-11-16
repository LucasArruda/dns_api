class CreateHostnames < ActiveRecord::Migration[5.2]
  def change
    create_table :hostnames do |t|
      t.string :hostname
      t.belongs_to :dns_record, index: true, foreign_key: true

      t.timestamps
    end
  end
end
