class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # tagging filter constants
  ALL_TAGS = 'All Tags'
  UNTAGGED = 'Untagged'

  # GET /notes
  def index
    # this tags array will help filtering notes by tag
    @all_tags = tags.unshift ALL_TAGS, UNTAGGED

    # handle tags filter values
    tag_filter = params[:tag] || ALL_TAGS
    show_tagged = [UNTAGGED, ALL_TAGS].exclude?(tag_filter)
    show_untagged = tag_filter == UNTAGGED
    
    # handle search and filtering
    all_notes = user_notes.search(params[:search])
    all_notes = show_tagged ? all_notes.with_tags(tag_filter) : all_notes
    all_notes = show_untagged ? all_notes.untagged : all_notes

    @notes = all_notes.page(params[:page]).per(params[:per_page])
  end

  # GET /notes/:id
  def show
  end

  # GET /notes/new
  def new
    @note = user_notes.new
    @all_tags = tags
  end

  # GET /notes/:id/edit
  def edit
  end

  # POST /notes
  def create
    @note = user_notes.new(note_params)
    @note.tags = note_params[:tags].split(',').map(&:strip)

    if @note.save
      redirect_to @note, notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /notes/:id
  def update
    if @note.update(note_params)
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /notes/:id
  def destroy
    @note.destroy
    redirect_to notes_url, notice: 'Note was successfully destroyed.'
  end

  private
    def set_note
      @note = user_notes.find(params[:id])
    end

    def user_notes
      @user_notes ||= @current_user.notes
    end

    def tags
      @tags ||= user_notes.select(:tags).pluck(:tags).flatten.uniq
    end

    def note_params
      params.fetch(:note, {}).permit(:title, :body, :tags)
    end
end
