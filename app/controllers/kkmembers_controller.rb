class KkmembersController < ApplicationController
  before_action :set_kkmember, only: [:edit, :update, :show, :destroy]
  before_action :require_admin_logged_in, except: [:new, :create]
  before_action :set_purok, only: [:destroy_purok]
  before_action :set_puroksall, only: [:purok, :new, :dashboard, :create]
  def index
    @kkmembers = Kkmember.includes(:personalinfo, :educationbg, :familybg, :healthinfo, :workbg).all
  end

  def dashboard
    @kkmembers_count = Kkmember.count
    @registered = Kkmember.joins(:personalinfo).where(personalinfos: { registeredvoter: "Yes" }).count
    @notregistered = Kkmember.joins(:personalinfo).where(personalinfos: { registeredvoter: "No" }).count
  
    @purok_populations = {}

    @puroks.each do |purok|
      purok_population = Kkmember.joins(:personalinfo).where(personalinfos: { purok: purok.purokname }).count
      @purok_populations[purok.purokname] = {
        population: purok_population,
        registered: Kkmember.joins(:personalinfo).where(personalinfos: { purok: purok.purokname, registeredvoter: "Yes" }).count,
        not_registered: Kkmember.joins(:personalinfo).where(personalinfos: { purok: purok.purokname, registeredvoter: "No" }).count
      }
    end
  end

  def show
  end

  def new
    @kkmember = Kkmember.new
    
  end

  def create
    @kkmember = Kkmember.new(kkmember_params)
    
    if @kkmember.save
      redirect_to kkmembers_path, notice: 'KK Member was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @kkmember.update(kkmember_params)
      redirect_to kkmembers_path, notice: 'KK Member was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @kkmember.destroy
    redirect_to kkmembers_path, notice: 'KK Member was successfully destroyed.'
  end


  # Puroks Area

  def purok
  end

  def create_purok
    purok_name = purok_params[:purokname]
    existing_purok = Purok.where('lower(purokname) = ?', purok_name.downcase).first

    if existing_purok
      flash[:alert] = 'Purok already exists.'
      redirect_to purok_path
    else
      @purok = Purok.new(purok_params)
      if @purok.save
        redirect_to purok_path, notice: 'Purok was successfully created.'
      else
        render :show_purok
      end
    end
  end

  def destroy_purok
    @purok.destroy
    flash[:alert] = 'Purok was successfully destroyed.'
    redirect_to purok_path
  end



  private

  def set_kkmember
    @kkmember = Kkmember.find(params[:id])
  end

  def kkmember_params
    params.require(:kkmember).permit(
      personalinfo_attributes: [
        :id, :lastname, :firstname, :middlename, :age, :sex, :birthdate, 
        :civilstatus, :contactno, :emailaddress, :purok, :address, 
        :nationality, :registeredvoter, :organization
      ],
      educationbg_attributes: [
        :id, :hea, :elementary, :highschool, :college, :course, 
        :educationstatus, :ifoutofschool
      ],
      workbg_attributes: [
        :id, :work, :agency
      ],
      healthinfo_attributes: [
        :id, :disabilities, :medicalcondition
      ],
      familybg_attributes: [
        :id, :father, :fatherwork, :solofather, :mother, :motherwork, 
        :solomother, :familymemberno, :bother, :sister
      ]
    )
  end

  def require_admin_logged_in
    redirect_to login_path unless admin_logged_in?
  end

  def set_purok
    @purok = Purok.find(params[:id])
  end

  def purok_params
    params.require(:purok).permit(:purokname)
  end

  def set_puroksall
    @puroks = Purok.all
  end
  
end
