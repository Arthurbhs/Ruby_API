class Contact < ApplicationRecord

def author
      "Arthur Barbos"
end
def as_json(options={})
  super(methods: :author, root: true)
end
end
