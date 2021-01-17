class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        first_name+" "+last_name
    end

    def list_roles
        shows.collect do |show|
            "#{show.characters.where(actor_id: id)[0].name} - #{show.name}" 
        end
    end
end