class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # # GET /users
  def index
    @users = User.all

    users_json = UserSerializer.new(@users).serialized_json
    render json: users_json
  end

  # GET /users/1
  def show
    user_json = UserSerializer.new(@user).serialized_json
    render json: user_json
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: UserSerializer.new(@user), status: :created
    else
      resp = {
        error: @user.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    @newbalance = @user.balance + (params[:user][:deposit]).to_i
    if @user.update(balance: @newbalance)
      render json: UserSerializer.new(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def transaction
    @seller = User.find_by(id: user_params[:seller_id])
    @price = (user_params[:price]).to_i
    @buyer = current_user

    if @buyer.balance > @price
    
      @seller_new_balance = @seller.balance + @price
      @buyer_new_balance = @buyer.balance - @price
    
      @seller.update(balance: @seller_new_balance)
      @buyer.update(balance: @buyer_new_balance)

      seller_to_return = UserSerializer.new(@seller)
      buyer_to_return = UserSerializer.new(@buyer)
      users_to_return = {
      seller: seller_to_return, 
      buyer: buyer_to_return}

      render json: users_to_return
    else
      render json: {
                error: "Not Enough Funds to Purchase."
        }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :balance, :deposit, :seller_id, :price)
    end
end
