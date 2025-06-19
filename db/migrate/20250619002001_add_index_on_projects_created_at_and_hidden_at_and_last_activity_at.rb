class AddIndexOnProjectsCreatedAtAndHiddenAtAndLastActivityAt < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_index :projects,
      [:created_at, :hidden_at, :last_activity_at],
      order: {created_at: :desc},
      name: "index_projects_on_created_at_desc_for_feed",
      algorithm: :concurrently
  end
end
