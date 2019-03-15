class UpdateIndexOnUsers < ActiveRecord::Migration[5.2]
  def up
    sql = 'DROP INDEX index_users_on_email'
    ActiveRecord::Base.connection.execute(sql)
  end
end
