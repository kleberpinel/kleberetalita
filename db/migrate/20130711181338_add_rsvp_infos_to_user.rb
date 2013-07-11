class AddRsvpInfosToUser < ActiveRecord::Migration
  def up
	  change_table :users do |t|
	  	t.boolean :rsvp_executado
	  end
	end

	#def down
	#	remove_column :users, :rsvp_executado
	#end
end
