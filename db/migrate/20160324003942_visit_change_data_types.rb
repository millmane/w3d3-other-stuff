class VisitChangeDataTypes < ActiveRecord::Migration
  def change
    rename_column :visits, :user, :user_id
    rename_column :visits, :shortened_url, :shortened_url_id
    change_column :visits, :user_id, :integer
    change_column :visits, :shortened_url_id, :integer
  end
end
