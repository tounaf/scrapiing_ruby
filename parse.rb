require 'nokogiri'
require 'open-uri'

#cette methode va getter l'addresse email
def  get_all_the_urls_of_val_doise_townhalls(page_url)
    tab = []
    doc = Nokogiri::HTML(open(page_url))
    tab_lien = doc.css("a").select{|link| link['class']=="lientxt"}
    lien ="http://annuaire-des-mairies.com/"
    tab_lien.each{|link| tab.push(lien+link['href'])}
    tab
end
#puts get_all_the_urls_of_val_doise_townhalls('http://annuaire-des-mairies.com/val-d-oise.html')

#cette methode va  getter tous les url de chaque ville du departement 
def get_the_email_of_a_townhal_from_its_webpage(url_page)
    doc = Nokogiri::HTML(open(url_page))
    email = doc.css(".txt-primary")[3].text.split(" ")
    email[2]
end
#puts get_the_email_of_a_townhal_from_its_webpage('http://annuaire-des-mairies.com/95/vaureal.html')
  def  get_nom(url)
    tab = []
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"))
    tab_lien = doc.css("a").select{|link| link['class']=="lientxt"}
    tab_lien.each{|link| tab.push(link.text)}
    tab
  end

#puts get_nom


def hash_nom_email
  #vile_mail = []
  hash_url = []
  hash_nom = []
  mail = []
  tab=[]
  hash_url = get_all_the_urls_of_val_doise_townhalls('http://annuaire-des-mairies.com/val-d-oise.html')
  hash_url.each{ |l| mail << get_the_email_of_a_townhal_from_its_webpage(l) }
  hash_nom = get_nom('http://annuaire-des-mairies.com/val-d-oise.html')
#puts hash_nom_email

   for i in 0..hash_nom.length-1
    vile_mail={
      nom: "",
      email: ""
  }
  vile_mail[:nom]=hash_nom[i]
  vile_mail[:email]=mail[i]
  tab << vile_mail
  end
  tab
end
puts hash_nom_email
