class AddressUsersController < API::V1::BaseController
  before_action :set_address_user, only: [:show, :edit, :update, :destroy]

  # GET /address_users
  # GET /address_users.json
  def index
    @address_users = AddressUser.all
  end

  # GET /address_users/1
  # GET /address_users/1.json
  def show
  end

  # GET /address_users/new
  def new
    @address_user = AddressUser.new
  end

  # GET /address_users/1/edit
  def edit
  end

  # POST /address_users
  # POST /address_users.json
  def create
    @address_user = AddressUser.new(address_user_params)

    respond_to do |format|
      if @address_user.save
        format.html { redirect_to @address_user, notice: 'Address user was successfully created.' }
        format.json { render :show, status: :created, location: @address_user }
      else
        format.html { render :new }
        format.json { render json: @address_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /address_users/1
  # PATCH/PUT /address_users/1.json
  def update
    respond_to do |format|
      if @address_user.update(address_user_params)
        format.html { redirect_to @address_user, notice: 'Address user was successfully updated.' }
        format.json { render :show, status: :ok, location: @address_user }
      else
        format.html { render :edit }
        format.json { render json: @address_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /address_users/1
  # DELETE /address_users/1.json
  def destroy
    @address_user.destroy
    respond_to do |format|
      format.html { redirect_to address_users_url, notice: 'Address user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address_user
      @address_user = AddressUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_user_params
      params.require(:address_user).permit(:address_id, :user_id)
    end
end
