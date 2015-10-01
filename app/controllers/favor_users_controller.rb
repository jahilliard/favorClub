class FavorUsersController < ApplicationController
  before_action :set_favor_user, only: [:show, :edit, :update, :destroy]

  # GET /favor_users
  # GET /favor_users.json
  def index
    @favor_users = FavorUser.all
  end

  # GET /favor_users/1
  # GET /favor_users/1.json
  def show
  end

  # GET /favor_users/new
  def new
    @favor_user = FavorUser.new
  end

  # GET /favor_users/1/edit
  def edit
  end

  # POST /favor_users
  # POST /favor_users.json
  def create
    @favor_user = FavorUser.new(favor_user_params)

    respond_to do |format|
      if @favor_user.save
        format.html { redirect_to @favor_user, notice: 'Favor user was successfully created.' }
        format.json { render :show, status: :created, location: @favor_user }
      else
        format.html { render :new }
        format.json { render json: @favor_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favor_users/1
  # PATCH/PUT /favor_users/1.json
  def update
    respond_to do |format|
      if @favor_user.update(favor_user_params)
        format.html { redirect_to @favor_user, notice: 'Favor user was successfully updated.' }
        format.json { render :show, status: :ok, location: @favor_user }
      else
        format.html { render :edit }
        format.json { render json: @favor_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favor_users/1
  # DELETE /favor_users/1.json
  def destroy
    @favor_user.destroy
    respond_to do |format|
      format.html { redirect_to favor_users_url, notice: 'Favor user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favor_user
      @favor_user = FavorUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favor_user_params
      params.require(:favor_user).permit(:favor_id, :user_id, :role, :notes)
    end
end
