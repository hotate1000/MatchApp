class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end

    # add_index :テーブル名, :カラム名
    # インデックスの設定、検索速度が上がる。インデックスを多く設定すると遅くなる
    add_index :relationships, :follower_id
    add_index :relationships, :following_id

    # add_index :テーブル名, :カラム名, unique: true
    # 一意性制約、重複するデータを禁止する
    add_index :relationships, [:follower_id, :following_id], unique: true
  end
end
