class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string     :content
      t.text       :image
      t.references :group_id, forign_key: true
      t.references :user_id,  forign_key: true

      t.timestamps
    end
  end
end
