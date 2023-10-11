class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]

  def index
    @notes = Note.includes(:note_categories).all.order(created_at: :desc)
  end

  def show; end

  def new
    @note = Note.new
    @note_categories = NoteCategory.all
  end

  def create
    @note = Note.new(note_params)
    note_category_ids = params[:note][:note_category_ids].reject(&:empty?)

    @note.note_categories << NoteCategory.find(note_category_ids)

    if @note.save
      redirect_to notes_path, notice: '筆記新增成功'
    else
      @note_categories = NoteCategory.all
      render :new
    end
  end

  def edit
    @note_categories = NoteCategory.all
  end

  def update
    note_category_ids = params[:note][:note_category_ids].reject(&:empty?)

    @note.note_categories << NoteCategory.find(note_category_ids)

    if @note.update(note_params)
      redirect_to notes_path, notice: '筆記修改成功'
    else
      @note_categories = NoteCategory.all
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_url, notice: "已刪除筆記: #{@note.title}"
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content, note_category_ids: []) # 使用 _ids: [], 來允許複選的狀況
  end
end
