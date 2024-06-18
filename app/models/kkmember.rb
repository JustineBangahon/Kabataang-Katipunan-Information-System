class Kkmember < ApplicationRecord
   belongs_to :personalinfo, dependent: :destroy
   belongs_to :educationbg, dependent: :destroy
   belongs_to :familybg, dependent: :destroy
   belongs_to :healthinfo, dependent: :destroy
   belongs_to :workbg, dependent: :destroy
   accepts_nested_attributes_for :personalinfo, :educationbg, :familybg, :healthinfo, :workbg
  end