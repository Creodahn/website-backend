class CreateProjectsSkills < ActiveRecord::Migration
  def change
    create_table :projects_skills do |t|
      t.timestamps null: false
    end

    add_reference :projects_skills, :project, index: true
    add_reference :projects_skills, :skill, index: true
  end
end
