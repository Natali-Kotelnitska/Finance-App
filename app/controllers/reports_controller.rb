class ReportsController < ApplicationController
  def index
  end

  def report
    puts params
    if params[:btn_date]
      redirect_to({ 
        action: "report_by_dates", 
        category_id: params[:category],
        operation_type: params[:operation_type],
        start_date: params[:start_date], 
        end_date: params[:end_date]
      })
    elsif params[:btn_cat]
      redirect_to({
        action: "report_by_category",
        category_id: params[:category],
        operation_type: params[:operation_type],
        start_date: params[:start_date], 
        end_date: params[:end_date]
        
    })
    end
  end

  def report_by_category
    # @data = params
    @category = Category.find(params[:category_id])
    @operation = Operation.where("category_id": @category.id)
    @total = @operation.sum(:amount)

    @dataArr = @operation.map{|el| [el.amount.to_i, el.description ]}
    @amount = @dataArr.map {|d| d[0]}
    @description = @dataArr.map {|d| d[1]}
  end

  def report_by_dates
    # @data = params
    @operations = Operation.all
    @days= (params[:start_date]..params[:end_date])

    @groups = Operation.where( [...@days].include?(:created_at) ).group_by_day
  #  @operations.where(start_date..end_date)

   @dataR = @operations.map{|el| [el.amount.to_i, el.odate.strftime("%d/%m/%Y") ]}
   @dates = @dataR.map {|d| d[1]}
   @rates = @dataR.map {|d| d[0]}
  end

  def operation_params
      params.require(:operation).permit(:amount, :odate, :description, :operation_type, :operation_id, :category_name, :category_id)
    end
end
