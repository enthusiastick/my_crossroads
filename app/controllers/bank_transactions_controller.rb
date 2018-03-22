class BankTransactionsController < ApplicationController
  def create
    @character = Character.find_by(slug: params[:character_id])
    @account = BankAccount.find(params[:bank_account_id])
    @transaction= BankTransaction.new(
      bank_account_id:@account.id,
      transaction_type: transaction_params[:transaction_type],
      transaction_amount: transaction_params[:transaction_amount]
    )
    if @transaction.save
      BankTransaction.calculate_balance(@account, @transaction)
      redirect_to character_bank_account_path(@character.id, @account.id)
      flash[:notice] = 'Transaction added successfully'
    else
      flash[:notice] = 'Transaction add failed'
      render :new
    end

  end

  def new
    @character = Character.find(params[:character_id])
    @account = BankAccount.find(params[:bank_account_id])
    @transaction = BankTransaction.new
  end


  protected
  def transaction_params
    params.require(:bank_transaction).permit(:transaction_type, :transaction_amount)

  end
end
