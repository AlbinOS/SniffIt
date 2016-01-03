module Faker
  class Wine < Base
    class << self
      def appellation
        appellations.sample
      end

      def domaine
        domaines.sample
      end

      def appellations
        ['Châteauneuf-du-Pape', 'Saint-Emilion', 'Barolo', 'Champagne', 'Côtes de Bordeaux', 'Rioja', 'Haut-Médoc', 'Côtes de Provence', 'Chianti']
      end

      def domaines
        ['Château Larcis Ducasse', 'Louis Roederer', 'Domaine de l\'A Castillon', 'Poggerino', 'Pierre Paillard', 'Pierre-Yves Colin-Morey', 'Château de Retout', 'Kongsgaard']
      end

    end
  end
end

def vintage_or_not
  if Random.rand(10) > 1
    Faker::Date.between(100.years.ago, 1.years.ago).year
  else
    nil
  end
end

FactoryGirl.define do
  factory :wine do
    appellation { Faker::Wine.appellation }
    domaine { Faker::Wine.domaine }
    vintage { vintage_or_not }
    association :user, factory: :user
  end
end 

