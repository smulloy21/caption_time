class InitializeModels < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :username, :string
      t.column :admin, :boolean
      t.timestamps
    end

    create_table :image do |t|
      t.column :user_id, :integer
      t.column :img, :string
      t.column :upvotes, :integer, default: 0
      t.column :downvotes, :integer, default: 0
      t.timestamps
    end

    create_table :caption do |t|
      t.column :user_id, :integer
      t.column :text, :string
      t.column :upvotes, :integer, default: 0
      t.column :downvotes, :integer, default: 0
      t.references :captionable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
