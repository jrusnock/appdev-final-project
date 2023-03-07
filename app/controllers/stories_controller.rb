class StoriesController < ApplicationController
  def index
    matching_stories = Story.all

    @list_of_stories = matching_stories.order({ :created_at => :desc })

    render({ :template => "stories/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_stories = Story.where({ :id => the_id })

    @the_story = matching_stories.at(0)

    render({ :template => "stories/show.html.erb" })
  end

  def create
    the_story = Story.new
    the_story.title = params.fetch("query_title")
    the_story.story = params.fetch("query_story")
    the_story.owner_id = params.fetch("query_owner_id")
    the_story.description = params.fetch("query_description")
    the_story.boomarks_count = params.fetch("query_boomarks_count")

    if the_story.valid?
      the_story.save
      redirect_to("/stories", { :notice => "Story created successfully." })
    else
      redirect_to("/stories", { :alert => the_story.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_story = Story.where({ :id => the_id }).at(0)

    the_story.title = params.fetch("query_title")
    the_story.story = params.fetch("query_story")
    the_story.owner_id = params.fetch("query_owner_id")
    the_story.description = params.fetch("query_description")
    the_story.boomarks_count = params.fetch("query_boomarks_count")

    if the_story.valid?
      the_story.save
      redirect_to("/stories/#{the_story.id}", { :notice => "Story updated successfully."} )
    else
      redirect_to("/stories/#{the_story.id}", { :alert => the_story.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_story = Story.where({ :id => the_id }).at(0)

    the_story.destroy

    redirect_to("/stories", { :notice => "Story deleted successfully."} )
  end

  def generate
    render({ :template => "stories/new_story.html.erb" })
  end
end
