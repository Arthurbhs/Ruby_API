class Contact < ApplicationRecord
  belongs_to  :kind 
def author
      "Arthur Barbos"
end

def kind_description
  self.kind.description
end

def as_json(options={})
  super(root: true,
    methods: [:author, :kind_description],
    include: { kind: { only: :description, :author}}
   )
 end
end
