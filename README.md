PARTE II

Problema:


```
class Animal < ApplicationController

  def create

    kind = params[:animal][:kind]

    if kind == "Dog":
      animal = Dog.new(animal_params)
    elsif kind == "Cat"
      animal = Cat.new(animal_params)
    else
      animal = Cow.new(animal_params)
    end
  end
end
```
Para solucionar lo anterior debes ejecutar, dado que la naturaleza de cualquier especie es un animal:

1.- rails new project  \
2.- rails g model animal type:references {polymorfhic}\\
3.- rails g model dog \
4.- rails g model cat \
5.- rails g model cow \


para el siguiente paso debemos agregar en cada modelo:

```
Class Animal < ApplicationRecord
  belongs_to :type, polymorphic:true
end

Class Dog < ApplicationRecord
  has_many :characteristic, as: :type
end

Class Cat < ApplicationRecord
  has_many :characteristic, as: :type
end

Class Cow < ApplicationRecord
  has_many :characteristic, as: :type
end
```

Para ejecutar esto abre la terminal y digita:

1.- rails c\
2.- Dog.create\
3.- Dog.last.types << Animal.new\
4.- Cat.create\
5.- Cat.last.characteristics << Animal.new\
6.- Cow.create\
7.- Cow.last.characteristics << Animal.new\

Puedes validar los animales creados en Animal.all, acá tendrás todos los animales ingresados con el tipo de animal y el id de la tabla de su tipo, con esto puedes tener nombres de animales o caracteriscas iguales sin embargo son datos de dos animales diferentes.

Si necesitas agregar otro tipo de animal debes crear otro modelo
