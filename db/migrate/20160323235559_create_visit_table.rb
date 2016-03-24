class CreateVisitTable < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :shortened_url
      t.string :user

      t.timestamp
    end

    add_index :visits, [:shortened_url, :user]
  end
end
