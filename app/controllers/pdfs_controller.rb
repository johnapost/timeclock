class PdfsController < ApplicationController
  before_filter :authenticate_user!, :get_user

  def show
    @user = User.find params[:id]

    respond_to do |format|
      format.pdf do
        pdf = Pdf.new @user
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end
end
