require "rails_helper"

feature "DIRECTORS" do
  context "index" do
    it "has the name of every row", points: 5 do
      test_directors = create_list(:director, 5)

      visit "/directors"

      test_directors.each do |current_director|
        expect(page).to have_content(current_director.name)
      end
    end
  end

  context "index" do
    it "has the bio of every row", points: 5 do
      test_directors = create_list(:director, 5)

      visit "/directors"

      test_directors.each do |current_director|
        expect(page).to have_content(current_director.bio)
      end
    end
  end

  context "index" do
    it "has the dob of every row", points: 5 do
      test_directors = create_list(:director, 5)

      visit "/directors"

      test_directors.each do |current_director|
        expect(page).to have_content(current_director.dob)
      end
    end
  end

  context "index" do
    it "has the image url of every row", points: 5 do
      test_directors = create_list(:director, 5)

      visit "/directors"

      test_directors.each do |current_director|
        expect(page).to have_content(current_director.image_url)
      end
    end
  end

  context "index" do
    it "has a link to the details page of every row", points: 5 do
      test_directors = create_list(:director, 5)

      visit "/directors"

      test_directors.each do |current_director|
        expect(page).to have_css("a[href*='#{current_director.id}']", text: "Show details")
      end
    end
  end

  context "details page" do
    it "has the correct name", points: 3 do
      director_to_show = create(:director)

      visit "/directors"
      find("a[href*='#{director_to_show.id}']", text: "Show details").click

      expect(page).to have_content(director_to_show.name)
    end
  end

  context "details page" do
    it "has the correct bio", points: 3 do
      director_to_show = create(:director)

      visit "/directors"
      find("a[href*='#{director_to_show.id}']", text: "Show details").click

      expect(page).to have_content(director_to_show.bio)
    end
  end

  context "details page" do
    it "has the correct dob", points: 3 do
      director_to_show = create(:director)

      visit "/directors"
      find("a[href*='#{director_to_show.id}']", text: "Show details").click

      expect(page).to have_content(director_to_show.dob)
    end
  end

  context "details page" do
    it "has the correct image url", points: 3 do
      director_to_show = create(:director)

      visit "/directors"
      find("a[href*='#{director_to_show.id}']", text: "Show details").click

      expect(page).to have_content(director_to_show.image_url)
    end
  end

  context "index" do
    it "has a link to the new director page", points: 2 do
      visit "/directors"

      expect(page).to have_css("a", text: "Add a new director")
    end
  end

  context "new form" do
    it "saves the name when submitted", points: 2, hint: h("label_for_input") do
      visit "/directors"
      click_on "Add a new director"

      test_name = "A fake name I'm typing at #{Time.now}"
      fill_in "Name", with: test_name

      click_on "Create director"

      last_director = Director.order(created_at: :asc).last
      expect(last_director.name).to eq(test_name)
    end
  end

  context "new form" do
    it "saves the bio when submitted", points: 2, hint: h("label_for_input") do
      visit "/directors"
      click_on "Add a new director"

      test_bio = "A fake bio I'm typing at #{Time.now}"
      fill_in "Bio", with: test_bio

      click_on "Create director"

      last_director = Director.order(created_at: :asc).last
      expect(last_director.bio).to eq(test_bio)
    end
  end

  context "new form" do
    it "saves the dob when submitted", points: 2, hint: h("label_for_input") do
      visit "/directors"
      click_on "Add a new director"

      test_dob = "A fake dob I'm typing at #{Time.now}"
      fill_in "Dob", with: test_dob

      click_on "Create director"

      last_director = Director.order(created_at: :asc).last
      expect(last_director.dob).to eq(test_dob)
    end
  end

  context "new form" do
    it "saves the image url when submitted", points: 2, hint: h("label_for_input") do
      visit "/directors"
      click_on "Add a new director"

      test_image_url = "A fake image url I'm typing at #{Time.now}"
      fill_in "Image url", with: test_image_url

      click_on "Create director"

      last_director = Director.order(created_at: :asc).last
      expect(last_director.image_url).to eq(test_image_url)
    end
  end

  context "new form" do
    it "redirects to the index when submitted", points: 2, hint: h("redirect_vs_render") do
      visit "/directors"
      click_on "Add a new director"

      click_on "Create director"

      expect(page).to have_current_path("/directors")
    end
  end

  context "details page" do
    it "has a 'Delete director' link", points: 2 do
      director_to_delete = create(:director)

      visit "/directors"
      find("a[href*='#{director_to_delete.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Delete")
    end
  end

  context "delete link" do
    it "removes a row from the table", points: 5 do
      director_to_delete = create(:director)

      visit "/directors"
      find("a[href*='#{director_to_delete.id}']", text: "Show details").click
      click_on "Delete director"

      expect(Director.exists?(director_to_delete.id)).to be(false)
    end
  end

  context "delete link" do
    it "redirects to the index", points: 3, hint: h("redirect_vs_render") do
      director_to_delete = create(:director)

      visit "/directors"
      find("a[href*='#{director_to_delete.id}']", text: "Show details").click
      click_on "Delete director"

      expect(page).to have_current_path("/directors")
    end
  end

  context "details page" do
    it "has an 'Edit director' link", points: 5 do
      director_to_edit = create(:director)

      visit "/directors"
      find("a[href*='#{director_to_edit.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Edit director")
    end
  end

  context "edit form" do
    it "has name pre-populated", points: 3, hint: h("value_attribute") do
      director_to_edit = create(:director)

      visit "/directors"
      find("a[href*='#{director_to_edit.id}']", text: "Show details").click
      click_on "Edit director"

      expect(page).to have_css("input[value='#{director_to_edit.name}']")
    end
  end

  context "edit form" do
    it "has bio pre-populated", points: 3, hint: h("value_attribute") do
      director_to_edit = create(:director)

      visit "/directors"
      find("a[href*='#{director_to_edit.id}']", text: "Show details").click
      click_on "Edit director"

      expect(page).to have_content(director_to_edit.bio)
    end
  end

  context "edit form" do
    it "has dob pre-populated", points: 3, hint: h("value_attribute") do
      director_to_edit = create(:director)

      visit "/directors"
      find("a[href*='#{director_to_edit.id}']", text: "Show details").click
      click_on "Edit director"

      expect(page).to have_css("input[value='#{director_to_edit.dob}']")
    end
  end

  context "edit form" do
    it "has image url pre-populated", points: 3, hint: h("value_attribute") do
      director_to_edit = create(:director)

      visit "/directors"
      find("a[href*='#{director_to_edit.id}']", text: "Show details").click
      click_on "Edit director"

      expect(page).to have_css("input[value='#{director_to_edit.image_url}']")
    end
  end

  context "edit form" do
    it "updates name when submitted", points: 5, hint: h("label_for_input button_type") do
      director_to_edit = create(:director, name: "Boring old name")

      visit "/directors"
      find("a[href*='#{director_to_edit.id}']", text: "Show details").click
      click_on "Edit director"

      test_name = "Exciting new name at #{Time.now}"
      fill_in "Name", with: test_name

      click_on "Update director"

      director_as_revised = Director.find(director_to_edit.id)

      expect(director_as_revised.name).to eq(test_name)
    end
  end

  context "edit form" do
    it "updates bio when submitted", points: 5, hint: h("label_for_input button_type") do
      director_to_edit = create(:director, bio: "Boring old bio")

      visit "/directors"
      find("a[href*='#{director_to_edit.id}']", text: "Show details").click
      click_on "Edit director"

      test_bio = "Exciting new bio at #{Time.now}"
      fill_in "Bio", with: test_bio

      click_on "Update director"

      director_as_revised = Director.find(director_to_edit.id)

      expect(director_as_revised.bio).to eq(test_bio)
    end
  end

  context "edit form" do
    it "updates dob when submitted", points: 5, hint: h("label_for_input button_type") do
      director_to_edit = create(:director, dob: "Boring old dob")

      visit "/directors"
      find("a[href*='#{director_to_edit.id}']", text: "Show details").click
      click_on "Edit director"

      test_dob = "Exciting new dob at #{Time.now}"
      fill_in "Dob", with: test_dob

      click_on "Update director"

      director_as_revised = Director.find(director_to_edit.id)

      expect(director_as_revised.dob).to eq(test_dob)
    end
  end

  context "edit form" do
    it "updates image url when submitted", points: 5, hint: h("label_for_input button_type") do
      director_to_edit = create(:director, image_url: "Boring old image url")

      visit "/directors"
      find("a[href*='#{director_to_edit.id}']", text: "Show details").click
      click_on "Edit director"

      test_image_url = "Exciting new image url at #{Time.now}"
      fill_in "Image url", with: test_image_url

      click_on "Update director"

      director_as_revised = Director.find(director_to_edit.id)

      expect(director_as_revised.image_url).to eq(test_image_url)
    end
  end

  context "edit form" do
    it "redirects to the details page", points: 3, hint: h("embed_vs_interpolate redirect_vs_render") do
      director_to_edit = create(:director)

      visit "/directors"
      find("a[href*='#{director_to_edit.id}']", text: "Show details").click
      details_page_path = page.current_path

      click_on "Edit director"
      click_on "Update director"

      expect(page).to have_current_path(details_page_path, only_path: true)
    end
  end
end
