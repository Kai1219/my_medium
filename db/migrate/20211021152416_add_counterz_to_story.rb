class AddCounterzToStory < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :clap, :integer, default: 0
  end
end
