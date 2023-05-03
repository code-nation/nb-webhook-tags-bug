class CreatePersonWebhooks < ActiveRecord::Migration[7.0]
  def change
    create_table :person_webhooks do |t|
      t.bigint :nb_signup_id
      t.string :tags, array: true, default: '{}'
      t.string :actual_latest_tags, array: true, default: '{}'
      t.string :missing_tags, array: true, default: '{}'
      t.boolean :has_missing_tags, null: false, default: false

      t.timestamps
    end
    add_index :person_webhooks, :has_missing_tags
  end
end
