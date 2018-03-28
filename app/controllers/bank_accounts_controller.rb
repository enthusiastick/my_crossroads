class BankAccountsController < ApplicationController

  def index
    if current_user.banker?|| current_user.staff?
      @accounts = BankAccount.all
      @characters_without_accounts = Character.includes(:bank_account).where(archived: false, bank_accounts: { id: nil })
      @account = BankAccount.new
    else
      authenticate_staff!
    end
  end

  def show
    @character = Character.find_by(slug: params[:character_id])
      if !@character
        @character = Character.find(params[:character_id])
      end
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
