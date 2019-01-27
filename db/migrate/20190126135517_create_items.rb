class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :message
      t.string :token

      t.timestamps
    end
  end
end
