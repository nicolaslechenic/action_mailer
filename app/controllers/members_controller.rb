class MembersController < ApplicationController
  # GET /members/contact
  def contact; end

  # POST /members
  # POST /members.json
  def to_send
    Struct.new('Member', :name, :email, :content)
    member =
      Struct::Member.new(
        member_params[:name],
        member_params[:email],
        member_params[:content]
      )
      
    MemberMailer.with(member: member).welcome_email.deliver_now
    MemberMailer.with(member: member).myapp_email.deliver_now

    respond_to do |format|
      format.html { redirect_to contact_members_url, notice: 'Email was successfully sent.' }
      format.json { head :no_content }
    end
  end

  private
  def member_params
    params.permit(:name, :email, :content)
  end
end
