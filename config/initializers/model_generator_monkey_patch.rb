require 'rails/generators/active_record/model/model_generator'
ActiveRecord::Generators::ModelGenerator.class_eval do
  def generate_activeadmin

    invoke "active_admin:resource", [singular_table_name]

    sentinel = /.*ActiveAdmin.register.*do.*/

    inside "app" do
      inside "admin" do
        if File.exist?("#{singular_table_name}.rb")
          insert_into_file "#{singular_table_name}.rb", after: sentinel do
            "\n  permit_params #{attributes_names.map { |name| ":#{name}" }.join(", ")}\n"
          end
        end
      end
    end
  end
end
