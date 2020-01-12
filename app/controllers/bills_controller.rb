class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy, :pay]

  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create
    new_bill_params = bill_params
    new_bill_params[:due_amount] = bill_params[:due_amount].to_f * 100

    new_bill_params[:paid_date] = nil

    @bill = Bill.new(new_bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to "/", notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    update_bill_params = bill_params
    
    puts "=====> BEFORE #{update_bill_params[:due_amount]}"
    update_bill_params[:due_amount] = bill_params[:due_amount].to_f * 100
    puts "=====> AFTER #{update_bill_params[:due_amount]}"

    update_bill_params[:paid_amount] = bill_params[:paid_amount].to_f * 100

    respond_to do |format|
      if @bill.update(update_bill_params)
        format.html { redirect_to "/", notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def pay
    @bill.update({ paid_date: Time.now, paid_amount: @bill[:due_amount] })
    redirect_to bills_url, notice: 'Bill was successfully paid'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:name, :notes, :url, :due_amount, :due_date, :paid_date, :paid_amount, :recurring, :automatic)
    end
end
