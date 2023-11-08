class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  # GET /rooms or /rooms.json
  def index
    # @rooms = Room.all
    @user = current_user
    @currentUserRooms = current_user.user_rooms

    myRoomIds = []
    @currentUserRooms.each do |userroom|
      myRoomIds << userroom.room.id
    end
    # チャット相手を新着順でとってくる
    @anotherUserRooms = UserRoom.where(room_id: myRoomIds).where.not(user_id:@user.id).order(created_at: :desc)
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @room = Room.find(params[:id])
    if UserRoom.where(:user_id => current_user.id, :room_id => @room.id).present?
      @chats = @room.chats
      @userrooms = @room.user_rooms
    else
      redirect_to profile_path
    end
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end

    # ActiveRecord::Base.transaction do
    #   @room = Room.new
    #   @room.save

    #   # UserRoomにログインユーザーを作成する
    #   @userroom1 = UserRoom.new(:room_id => @room.id, :user_id => current_user.id)
    #   @userroom1.save

    #   # UserRoomにチャット相手を作成する
    #   @userroom2 = UserRoom.new(:room_id => @room.id, :user_id => params[:user_room][:user_id])
    #   @userroom2.save
    # end

    # チャット画面に遷移する
    # redirect_to room_path(@room.id)
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    # @room.destroy

    # respond_to do |format|
    #   format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
    #   format.json { head :no_content }
    # end

    room = Room.find(params[:id])
    room.destroy
    redirect_to profile_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:room_name, :room_category_id, :user_id, :comment)
    end
end
