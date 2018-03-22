class BankAccountsController < ApplicationController
  def index
    if current_user.banker ==true || current_user.staff == true
      @accounts = BankAccount.all
      characters = Character.all
      @characters_without_accounts = []
      characters.each do |character|
        if !BankAccount.has_account?(character.id) == true && character.archived==false
          @characters_without_accounts << character
        end
      end
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
  end


  def create
    @account = BankAccount.new(account_params)
    @character = Character.find(account_params[:character_id])

    if @account.save
      redirect_to character_bank_account_path(@character.id,@account.id)
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
