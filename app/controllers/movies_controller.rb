class MoviesController < ApplicationController
    ## Movies
    def mv_new_form
        render("movies/mv_new_form.html.erb");
    end
    def mv_create_row
        r = Movie.new;
        
        r.title = params["title"];
        r.year = params["year"];
        r.duration = params["duration"];
        r.description = params["description"];
        r.image_url = params["image_url"];
        
        r.save;
        redirect_to "/movies";
    end
    def mv_index
        @list_movies = Movie.all.order('movies.id DESC');
        render("movies/mv_index.html.erb");
    end
    def mv_show
        @elem = Movie.find(params["id"]);
        
        render("movies/mv_show.html.erb");
    end
    def mv_edit_form
        @elem = Movie.find(params["id"]);
        render("movies/mv_edit_form.html.erb");
    end
    def mv_update_row
        r = Movie.find(params["id"]);
        
        r.title = params["title"];
        r.year = params["year"];
        r.duration = params["duration"];
        r.description = params["description"];
        r.image_url = params["image_url"];
        
        r.save;
        redirect_to "/movies/"+params["id"];
    end
    def mv_destroy_row
        Movie.find(params["id"]).destroy;
        redirect_to "/movies";
    end
    
    ## Movies
    def mv_new_form
        render("movies/mv_new_form.html.erb");
    end
    def mv_create_row
        r = Movie.new;
        
        r.title = params["title"];
        r.year = params["year"];
        r.duration = params["duration"];
        r.description = params["description"];
        r.image_url = params["image_url"];
        
        r.save;
        redirect_to "/movies";
    end
    def mv_index
        @list_movies = Movie.all.order('movies.id DESC');
        render("movies/mv_index.html.erb");
    end
    def mv_show
        @elem = Movie.find(params["id"]);
        
        render("movies/mv_show.html.erb");
    end
    def mv_edit_form
        @elem = Movie.find(params["id"]);
        render("movies/mv_edit_form.html.erb");
    end
    def mv_update_row
        r = Movie.find(params["id"]);
        
        r.title = params["title"];
        r.year = params["year"];
        r.duration = params["duration"];
        r.description = params["description"];
        r.image_url = params["image_url"];
        
        r.save;
        redirect_to "/movies/"+params["id"];
    end
    def mv_destroy_row
        Movie.find(params["id"]).destroy;
        redirect_to "/movies";
    end
end