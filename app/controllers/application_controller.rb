class ApplicationController < ActionController::Base
  before_action :list_all_notebooks_and_categories

  def home
    render '/home'
  end

  private

  def list_all_notebooks_and_categories
    @list_of_notebooks = Notebook.includes(note_categories: :notes).all
  end
end
