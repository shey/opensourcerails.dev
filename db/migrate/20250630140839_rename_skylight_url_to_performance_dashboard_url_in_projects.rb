class RenameSkylightUrlToPerformanceDashboardUrlInProjects < ActiveRecord::Migration[7.0]
  def change
    rename_column :projects, :skylight_url, :performance_dashboard_url
  end
end
