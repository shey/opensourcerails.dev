class AddSkylightUrlToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :skylight_url, :string
  end
end
