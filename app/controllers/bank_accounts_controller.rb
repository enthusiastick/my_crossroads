class BankAccountsController < ApplicationController
  before_action :authenticate_banker_or_staff!, only: [:create, :index]

  def index
    @accounts = BankAccount.all
    @characters_without_accounts = Character.includes(:bank_account).where(archived: false, bank_accounts: { id: nil }).alpha_by_name
    @account = BankAccount.new
  end

  def show
    @character = Character.find_by(slug: params[:character_id])
    if !current_user.banker && !current_user.staff
      authorize_user(@character.user)
    end
    @account = @character.bank_account
    @transactions = @account.bank_transactions
    @user = current_user
  end

  def create
    @account = BankAccount.new(account_params)
    if @account.save
      BankTransaction.create(
        bank_account_id:@account.id,
        transaction_type: "Initial Deposit",
        transaction_amount: @account.balance
      )
      redirect_to character_bank_account_path(@account.character,@account)
    else
      flash[:notice]="Account add failed"
    end
  end

  def authorize_user(user)
    unless user == current_user
      flash[:alert] = "You are not authorized for this record."
      redirect_to root_path
    end
  end

  protected

  def account_params
    params.require(:bank_account).permit(:character_id, :balance)
  end
end
