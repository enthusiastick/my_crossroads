class BankTransactionsController < ApplicationController
  def create
    @character = Character.find_by(slug: params[:character_id])
    @account = BankAccount.find(params[:bank_account_id])
    @target = Character.find_by_id(transaction_params[:target_account])
    if @target
      @target_account = @target.bank_account
    end
    @transaction_type = transaction_params[:transaction_type]
    @transaction_amount = transaction_params[:transaction_amount]
    if BankTransaction.validate_balance?(@account,@transaction_type, @transaction_amount)
      flash[:notice] = "Not enough drake for transaction"
      redirect_to bank_accounts_path and return
    end
    if @transaction_type == "Credit" || @transaction_type == "Debit"
      @transaction= BankTransaction.new(
        bank_account_id:@account.id,
        transaction_type: @transaction_type,
        transaction_amount: @transaction_amount,
        target_account: @target_account
      )
      if @transaction.save
        BankTransaction.calculate_balance(@account, @transaction)
        redirect_to character_bank_account_path(@character.id, @account.id)
        flash[:notice] = 'Transaction added successfully'
      else
        flash[:notice] = 'Transaction failed'
        render :new
      end
    else
      transactions = []
      transactions << BankTransaction.new(
        bank_account_id:@account.id,
        transaction_type: "Transfer to #{@target_account.character.name}",
        transaction_amount: @transaction_amount,
        target_account: @target_account
      )
      transactions << BankTransaction.new(
        bank_account_id:@target_account.id,
        transaction_type: "Transfer from #{@account.character.name}",
        transaction_amount: @transaction_amount,
        target_account: @account
      )
      if transactions.map(&:save)
        BankTransaction.transfer(@account, @target_account, @transaction_amount)
        redirect_to character_bank_account_path(@character.id, @account.id)
      else
        flash[:notice] = 'Transaction add failed'
        render :new
      end
    end

  end

  def new
    @character = Character.find(params[:character_id])
    @account = BankAccount.find(params[:bank_account_id])
    @characters_with_accounts = Character.includes(:bank_account).where.not(bank_accounts: { id: nil }, bank_accounts:{character_id: @character})
    @transaction = BankTransaction.new
  end


  protected
  def transaction_params
    params.require(:bank_transaction).permit(:transaction_type, :transaction_amount, :target_account)

  end
end
