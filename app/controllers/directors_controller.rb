class DirectorsController < ApplicationController
    ## Directors
    def dr_new_form
        render("directors/dr_new_form.html.erb");
    end
    def dr_create_row
        r = Director.new;
        
        r.name = params["name"];
        r.bio = params["bio"];
        r.dob = params["dob"];
        r.image_url = params["image_url"];
        
        r.save;
        redirect_to "/directors";
    end
    def dr_index
        @list_directors = Director.all.order('directors.id DESC');
        render("directors/dr_index.html.erb");
    end
    def dr_show
        @elem = Director.find(params["id"]);
        
        render("directors/dr_show.html.erb");
    end
    def dr_edit_form
        @elem = Director.find(params["id"]);
        render("directors/dr_edit_form.html.erb");
    end
    def dr_update_row
        r = Director.find(params["id"]);
        
        r.name = params["name"];
        r.bio = params["bio"];
        r.dob = params["dob"];
        r.image_url = params["image_url"];
        
        r.save;
        redirect_to "/directors/"+params["id"];
    end
    def dr_destroy_row
        Director.find(params["id"]).destroy;
        redirect_to "/directors";
    end
end