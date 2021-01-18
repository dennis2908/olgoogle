class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
	@user = User.new
  end
  
  def datamarkerown
  response = ['type'=>'FeatureCollection','features'=>[nil]];
  sql = "Select * from locations join users on users.id = locations.user_id where username = '#{params[:username]}'"
  @records_array = ActiveRecord::Base.connection.execute(sql)
  i=0
  @Arry = Array.new
  @records_array.each do |p|
    @properties = {
   'title'=>p['username'],
   'lat'=>p['lat'],
   'lng'=>p['lng'],
   'add'=>p['add'],
   'pos'=>'20'
  }
    @Arry[i] = {'type'=>'Feature','geometry'=>{'type'=>'Point','coordinates'=>[p['lng'], p['lat']]},'properties'=>@properties}
    i += 1
  end
  
  render json: {type:"FeatureCollection" ,features: @Arry}, status: :ok
  end

  def datamarker
    response = ['type'=>'FeatureCollection','features'=>[nil]];
    sql = "Select * from locations join users on users.id = locations.user_id"
    @records_array = ActiveRecord::Base.connection.execute(sql)
    i=0
    @Arry = Array.new
    @records_array.each do |p|
      @properties = {
     'title'=>p['username'],
     'lat'=>p['lat'],
     'lng'=>p['lng'],
     'add'=>p['add'],
     'pos'=>20+(i*10)
    }
      @Arry[i] = {'type'=>'Feature','geometry'=>{'type'=>'Point','coordinates'=>[p['lng'], p['lat']]},'properties'=>@properties}
      i += 1
    end
    
    render json: {type:"FeatureCollection" ,features: @Arry}, status: :ok
    end
  
  def saveLocation
    @search = Location.where(user_id: session[:user_id]).limit(1)
    if @search.any?
      Location.where(user_id:session[:user_id]).update_all(lat: params[:lat],lng: params[:lng],add:params[:add])
    else
      @record = Location.new(lat: params[:lat],lng: params[:lng],add:params[:add],user_id:session[:user_id])
      @record.save()
    end 
    render json: {data:params[':username']}, status: :ok

  end

  def create
   @user = User.create(params.require(:user).permit(:username,        
   :password))   
   session[:user_id] = @user.id   
   redirect_to '/welcome'
  end
end