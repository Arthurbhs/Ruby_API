class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) {kind_url(object.kind.id)}
  end

belongs_to  :kind
has_many :phones 



  # link(:self)  { contact_path(object.id)}
  # link(:kind) {kind_path(object.kind.id)}

  meta do 

    {author: "Arthur Barbos..."}
  end
  

  def attributes(*args)
    h = super(*args)
    # formatação em pt-BR ___ -> pt.BR -> h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end

end
