class AddUserToPosts < ActiveRecord::Migration[8.0]
  def change
    
    add_reference :posts, :user, foreign_key: true

    
    default_user = User.first 
    Post.update_all(user_id: default_user.id) if default_user

    
    change_column_null :posts, :user_id, false
  end
end
