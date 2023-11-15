class RoomEntriesController < ApplicationController
  before_action :set_room_entry, only: %i[ show edit update destroy ]

  # GET /room_entries or /room_entries.json
  def index
    @room_entries = RoomEntry.all
  end

  # GET /room_entries/1 or /room_entries/1.json
  def show
  end

  # GET /room_entries/new
  def new
    @room_entry = RoomEntry.new
    @user = current_user
  end

  # GET /room_entries/1/edit
  def edit
  end

  # POST /room_entries or /room_entries.json
  def create
    @room_entry = RoomEntry.new(room_entry_params)

    respond_to do |format|
      if @room_entry.save
        format.html { redirect_to room_entry_url(@room_entry), notice: "申請を出しました。" }
        format.json { render :show, status: :created, location: @room_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_entries/1 or /room_entries/1.json
  def update
    ActiveRecord::Base.transaction do
      if @room_entry.update(room_entry_params)

        @room = Room.find(@room_entry.room_id)

        # UserRoomにログインユーザーを作成する
        @userroom1 = UserRoom.new(:room_id => @room.id, :user_id => @room.user_id)
        @userroom1.save

        # UserRoomにチャット相手を作成する
        @userroom2 = UserRoom.new(:room_id => @room.id, :user_id => @room_entry.user_id)
        @userroom2.save

        #チャット画面に遷移する
        redirect_to room_path(@room.id)
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /room_entries/1 or /room_entries/1.json
  def destroy
    @room_entry.destroy

    respond_to do |format|
      format.html { redirect_to room_entries_url, notice: "Room entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_entry
      @room_entry = RoomEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_entry_params
      params.require(:room_entry).permit(:comment, :flag, :user_id)
    end
end
