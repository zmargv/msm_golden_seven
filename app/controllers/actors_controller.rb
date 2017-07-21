class ActorsController < ApplicationController
    ## Actors
    def ac_new_form
        render("actors/ac_new_form.html.erb");
    end
    def ac_create_row
        r = Actor.new;
        
        r.name = params["name"];
        r.bio = params["bio"];
        r.dob = params["dob"];
        r.image_url = params["image_url"];
        
        r.save;
        redirect_to "/actors";
    end
    def ac_index
        @list_actors = Actor.all.order('actors.id DESC');
        render("actors/ac_index.html.erb");
    end
    def ac_show
        @elem = Actor.find(params["id"]);
        
        render("actors/ac_show.html.erb");
    end
    def ac_edit_form
        @elem = Actor.find(params["id"]);
        render("actors/ac_edit_form.html.erb");
    end
    def ac_update_row
        r = Actor.find(params["id"]);
        
        r.name = params["name"];
        r.bio = params["bio"];
        r.dob = params["dob"];
        r.image_url = params["image_url"];
        
        r.save;
        redirect_to "/actors/"+params["id"];
    end
    def ac_destroy_row
        Actor.find(params["id"]).destroy;
        redirect_to "/actors";
    end
end