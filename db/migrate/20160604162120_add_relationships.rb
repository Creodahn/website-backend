class AddRelationships < ActiveRecord::Migration
  def change
    # Add person relationship to all models it owns
    add_reference :educations, :person, index: true
    add_reference :work_experiences, :person, index: true
    add_reference :skills, :person, index: true
    add_reference :projects, :person, index: true
    add_reference :images, :person, index: true

    # Add work_experiences key to projects
    add_reference :projects, :work_experience, index: true

    # Add image key to people for profile profilePicture
    add_reference :people, :profile_picture, index: true
  end
end
