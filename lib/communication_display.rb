class CommunicationDisplay
  def self.introduction
    p "Hello"
    p 'Bienvenue sur le csv parser'
  end

  def self.chosen_value
    p "Choisissez le chiffre correspondant au fichier json choisi"
    gets.chomp.to_i
  end

  def self.get_ur_file
    p "Récupérer votre fichier dans le dossier /output_csv_files"
  end
end
