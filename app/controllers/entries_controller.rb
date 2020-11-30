class EntriesController < ApplicationController
  before_action :authenticate_user
  before_action :set_entry, only: [:show, :update, :destroy]

  # GET /entries
  def index
    @user = User.find_by_id(params[:id])
    if @user = current_user
      @entries = @user.entries
      render json: @entries
    end
  end

  # GET /entries/1
  def show
    render json: @entry
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      render json: EntrySerializer.new(@entry), status: :created, location: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  def destroy
    if current_user
      @entry.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entry_params
      params.require(:entry).permit(:title, :content, :user_id)
    end
end
