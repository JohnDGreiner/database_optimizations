class AssemblyMailer < ApplicationMailer

  def send_an_email(name, email)

    @assembly = Assembly.find_by_name(name)
    @hits = []
    genes = Gene.joins(sequence: [:assembly]).where('assemblies.name ="'+name+'"')
    genes.each do |g|
      g.hits.each do |h|
        @hits << h
      end
    end
    @hits.sort! {|a, b| b.percent_similarity <=> a.percent_similarity}

  end
    mail(to: email, subject: "welcome")
  end


end
