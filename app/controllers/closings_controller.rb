class ClosingsController < ApplicationController
  # GET /closings
  # GET /closings.json

  
  def index
    if current_user == nil # confirm whether someone is signed in
      @need_to_log_in = "Log in to see your closings"
    else 
    @user_closings = Array.new # create an array to hold closings
    @closings = Closing.all # call on Closing model to assign all closings to @closing variable
    @closings.each do |closing|  # iterate over each closing in the array
      if closing.team_leader == nil # if the closing has no team leader, set it to none
        closing.team_leader = "none"
      end
      if closing.Bank_Closer == nil # if the closing has no team leader, set it to none
        closing.Bank_Closer = "none"
      end
       if closing.relationship_manager == nil # if the closing has no team leader, set it to none
        closing.relationship_manager = "none"
      end
       if closing.team_member_one == nil # if the closing has no team leader, set it to none
        closing.team_member_one = "none"
      end
       if closing.team_member_two == nil # if the closing has no team leader, set it to none
        closing.team_member_two = "none"
      end
       if closing.team_member_three == nil # if the closing has no team leader, set it to none
        closing.team_member_three = "none"
      end
       if closing.team_member_four == nil # if the closing has no team leader, set it to none
        closing.team_member_four = "none"
      end
       if closing.team_member_five == nil # if the closing has no team leader, set it to none
        closing.team_member_five = "none"
      end
       if closing.borrower_counsel_one == nil # if the closing has no team leader, set it to none
        closing.borrower_counsel_one = "none"
      end
       if closing.borrower_counsel_two == nil # if the closing has no team leader, set it to none
        closing.borrower_counsel_two = "none"
      end
       if closing.team_leader.include?(current_user.email) # if the current user is team leader then include closing in index
        @user_closings << closing
       end
        if closing.Bank_Closer.include?(current_user.email) # if the current user is team leader then include closing in index
        @user_closings << closing
       end
        if closing.relationship_manager.include?(current_user.email) # if the current user is team leader then include closing in index
        @user_closings << closing
       end
        if closing.team_member_one.include?(current_user.email) # if the current user is team leader then include closing in index
        @user_closings << closing
       end
       if closing.team_member_two.include?(current_user.email) # if the current user is team leader then include closing in index
        @user_closings << closing
       end
       if closing.team_member_three.include?(current_user.email) # if the current user is team leader then include closing in index
        @user_closings << closing
       end
       if closing.team_member_four.include?(current_user.email) # if the current user is team leader then include closing in index
        @user_closings << closing
       end
       if closing.team_member_five.include?(current_user.email) # if the current user is team leader then include closing in index
        @user_closings << closing
       end
       if closing.borrower_counsel_one.include?(current_user.email) # if the current user is team leader then include closing in index
        @user_closings << closing
       end
       if closing.borrower_counsel_two.include?(current_user.email) # if the current user is team leader then include closing in index
        @user_closings << closing
       end
     end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @closings }
    end
  end

  # GET /closings/1
  # GET /closings/1.json


  def show

    @closing = Closing.find(params[:id])
    session[:current_closing_values] = params #creates a session to pass Closing id value to Closing_Item

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @closing }
      end
    end
  end

  # GET /closings/new
  # GET /closings/new.json
  def new
    @closing = Closing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @closing }
    end
  end

  # GET /closings/1/edit
  def edit
    @closing = Closing.find(params[:id])
  end

  # POST /closings
  # POST /closings.json
  def create
    @closing = current_user.closings.new(params[:closing])
    users = Array.new
    users << @closing.team_member_one
    users << @closing.team_member_two
    users << @closing.team_member_three
    users << @closing.team_member_four
    users << @closing.team_member_five
    users << @closing.Bank_Closer
    users << @closing.relationship_manager
    users << @closing.borrower_counsel_one
    users << @closing.borrower_counsel_two
    subject = @closing.dealname
    UserMailer.send_mail_assigned(users, subject).deliver

    respond_to do |format|
      if @closing.save
        format.html { redirect_to @closing, notice: 'Closing was successfully created.' }
        format.json { render json: @closing, status: :created, location: @closing }
      else
        format.html { render action: "new" }
        format.json { render json: @closing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /closings/1
  # PUT /closings/1.json
  def update
    @closing = Closing.find(params[:id])
    if params[:closing] && params[:closing].has_key?(:user_id)
       params[:closing].delete(:user_id)
     end
     
    respond_to do |format|
      if @closing.update_attributes(params[:closing])
        format.html { redirect_to @closing, notice: 'Closing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @closing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /closings/1
  # DELETE /closings/1.json
  def destroy
    @closing = Closing.find(params[:id])
    @closing.destroy

    respond_to do |format|
      format.html { redirect_to closings_url }
      format.json { head :no_content }
    end
  end
  
 def send_text
    @closing = Closing.find(params[:id])
    phone_number = '+19048494540'
    client = Twilio::REST::Client.new "AC4ee5339c8cf59e2c7aaec90384c91981", "2022aeeda0de6c52ee08b3d20cabe67a"
    client.account.sms.messages.create(
    :from => phone_number,
    :to => '+19044727772',
    :body => "The following items are still pending #{@closing.content}"
    )
    end

  def send_mail
    @closing = Closing.find(params[:id])
    users = Array.new
    users << @closing.team_leader
    users << @closing.team_member_one
    subject = @closing.dealname
    items = Array.new
    items = @closing.closing_items
    UserMailer.send_mail(users, subject, items).deliver
    end

  def send_mail_sendgrid
    @closing = Closing.find(params[:id])
    @recipients = Array.new
    if @closing.Bank_Closer != nil
      @recipients << @closing.Bank_Closer
    end
    if @closing.team_member_one != nil
      @recipients << @closing.team_member_one
    end
    if @closing.team_member_two != nil
      @recipients << @closing.team_member_two
    end
    @recipient_list = String.new
    @recipient_list = @recipients.join('; ')
    url = "https://sendgrid.com/api/mail.send.json"
    response = HTTParty.post url, :body => {
    "api_user" => "jndewey",
    "api_key" => "huskers",
    "to" => @recipient_list,
    "from" => @closing.team_leader,
    "subject" => @closing.dealname,
    "text" => "The following items are still outstanding #{@closing.content}."
    }
    response.body
  end

  def generate_status_update
    @closing = Closing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @closing }
    end
  end

end
