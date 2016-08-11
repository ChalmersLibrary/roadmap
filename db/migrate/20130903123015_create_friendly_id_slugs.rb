class CreateFriendlyIdSlugs < ActiveRecord::Migration

  def self.up
    create_table :friendly_id_slugs do |t|
      t.string   :slug,           :null => false
      t.integer  :sluggable_id,   :null => false
      t.string   :sluggable_type, :limit => 40
      t.datetime :created_at
    end
    add_index :friendly_id_slugs, :sluggable_id
    add_index :friendly_id_slugs, [:slug, :sluggable_type], :unique => true, :length => {:slug => 191, :sluggable_type => 40}
    add_index :friendly_id_slugs, :sluggable_type
  end

  def self.down
    drop_table :friendly_id_slugs
  end
end

