class HomeController < ApplicationController
  def index
  	@articles = Article.all()
  	@sections = Section.all()
  end
	
  def section

  end
  	
  def show_article
  end

  def create_article_post
    section = Section.find(params["section_id"])
    article  = current_user.article.create(:title=>params["title"],:content=>params["content"],:section_id_id=>section.id)
    p = params["image"]
    new_filename = SecureRandom.hex + "." + p.original_filename.split(".")[1]

    File.open(Rails.root.join('public', 'uploads', new_filename), 'wb') do |file|
      file.write(p.read)
    end

    article.pic = new_filename
    article.save
    redirect_to "/"
  end
  
  def edit_article
    @article = Article.find(params["article_id"])
  end

  def delete_article
    article = Article.find(params["article_id"])
    article.destroy
    redirect_to '/'
  end

  def edit_article_post
    article = Article.find(params["article_id"])
    article.title = params["article_title"]
    article.content = params["article_content"]
    section = Section.find(params["section_id"])
    article.section_id_id = section.id;
    p = params["image"]
    new_filename = SecureRandom.hex + "." + p.original_filename.split(".")[1]
    
    File.open(Rails.root.join('public', 'uploads', new_filename), 'wb') do |file|
      file.write(p.read)
    end

    article.pic = new_filename
    article.save
    redirect_to "/"
  end  

  def create_section_post
  	section_name = params["section_name"]
  	section = Section.new(:title=>section_name)
  	section.save
  	redirect_to "/create_section"
  end
  	
  def create_section
    @sections = Section.all()
  end
  
  def edit_section
    @section = Section.find(params["section_id"])
  end

  def edit_section_post
    section = Section.find(params["section_id"])
    section.title = params["section_name"]
    section.save
    redirect_to "/"
  end  

  def delete_section
  	section = Section.find(params["section_id"])
    section.destroy
    redirect_to '/'
  end

  def admin_index
    @articles = Article.all()
    @sections = Section.all()
  end	

  
end
