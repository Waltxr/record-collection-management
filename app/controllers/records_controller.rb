class RecordsController < ApplicationController

  def index

  end

  def show

  end

  def new

    @record = Record.new
  end

  def create
    @user_record = UserRecord.create(user_record_params)
    @record = Record.new(record_params)
    @artist = Artist.find_or_create_by(name: params[:record][:artist])
    @record.artist = @artist
    @user_record.user_id = current_user.id
    @user_record.record_id = @record.id

    if @record.save
      current_user.records << @record
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    @record.update(record_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to user_path(current_user)
  end

  private

  def record_params
    params.require(:record).permit(:title, :genre, :release_date)
  end

  def user_record_params
    params.require(:record).require(:user_record).permit(:rating, :notes)
  end

end
