class SignupsController < ApplicationController
  
  before_filter :has_permission
  
  def new
    @signup = Signup.new
    @e = Event.find(params[:event_id])
    if Signup.where(:event_id=>params[:event_id], :user_id => current_user.id).length > 0
      @signup = Signup.where(:event_id=>params[:event_id], :user_id => current_user.id)[0]
      redirect_to events_signups_edit_path(params[:event_id],@signup.id)
    end
  end
  
  def create
    ##TODO
    # => update associations for users, events *and* signups
    @e = Event.find(params[:signup][:event_id])
    @signup = Signup.new(params[:signup])
    @signup.user = current_user
    respond_to do |format|
      if @signup.save
        @e.signups << @signup
        if @e.save
          format.html {redirect_to event_path(@e), :notice => "Signup successful"}
          format.xml {head :ok}
        else
          format.html{redirect_to events_path, :notice => "Signup wasn't successful"}
          format.xml {render :xml => @e.errors, :status => :unprocessable_entity}
        end
      else
        format.html {redirect_to events_path, :notice => "Signup wasn't successful"}
        format.xml {render :xml => @signup.errors, :status => :unprocessable_entity}        
      end
    end
  end

  def edit
    @signup = Signup.find(params[:id])
    @e = @signup.event
    @user = @signup.user
  end

  def update
    @signup = Signup.find(params[:id])
    @e = @signup.event
    @user = @signup.user
    respond_to do |format|
      if @signup.update_attributes(params[:signup])
        format.html { redirect_to event_path(@e), :notice=>"Signup updated "}
      else
        format.html { render :action => "edit"}
      end
    end
  end
  
  def mark
    @u = User.find(params[:user_id])
    @s = Signup.find(params[:id])
    if @s.attended == true
      @s.attended = false
    else
      @s.attended = true
    end
    respond_to do |format|
      if @s.save
        format.html {redirect_to event_path(@s.event), :notice => "Changed attended to "+@s.attended.to_s+" for "+@u.email}
        format.xml {head :ok}
        format.js { render :locals =>{:attended => @s.attended }}
      else
        format.html {redirect_to event_path(@s.event), :notice => "Change was unsuccessful"}
        format.xml {render :xml => @s.errors, :status => :unprocessable_entity}
        format.js { render :locals =>{:attended => @s.attended }}

      end
    end
  end

end
