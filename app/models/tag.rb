class Tag < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :episodes, :through => :taggings

  def self.with_names(names)
    names.map do |name|
      Tag.find_or_create_by_name(name)
    end
  end

  def display_name
    name.titleize.gsub("E ", "e")
  end

  def as_json(options)
    super((options||{}).merge({:only => [:name, :id]}))
  end
end
