class PhoneSerializer < ActiveModel::Serializer
    attributes :number

    belongs_to :phones do
      link(:related) { contact_phones_url(object.id) }
    end
  

  end