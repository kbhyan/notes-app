class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  def index
    @notes = user_notes.page(params[:page]).per(params[:per_page])
  end

  # GET /notes/:id
  def show
  end

  # GET /notes/new
  def new
    @note = user_notes.new
  end

  # GET /notes/:id/edit
  def edit
  end

  # POST /notes
  def create
    @note = user_notes.new(note_params)

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
      @notes ||= @current_user.notes
    end

    def note_params
      params.fetch(:note, {}).permit(:title, :body, :tags)
    end
end
