require 'yaml'

class SlideshowController < ApplicationController
  def index
    @presentations = Presentation.all
    @sections = Section.all(:order => [ :order.asc ])
    @pages = Page.all(:clue => 'cover')
    #@pages = Page.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @foobars }
      #format.js
    end
  end

  def display
    @pages = Page.all(:clue => params[:radio], :order => [ :order.asc] )
    respond_to do |format|
      format.html # display.html.erb
      #format.xml  { render :xml => @foobars }
      format.js # display.js.erb
    end
  end

  def dialog
    @snippets = Snippet.all(:name => params[:value])
    respond_to do |format|
      format.html # dialog.html.erb
      format.js # dialog.js.erb
    end
  end

  def restore_pages
    result = Page.restore
    render :text => result.join("<br/>")
  end

  def restore_presentations
    result = Presentation.restore
    render :text => result.join("<br/>")
  end

  def restore_sections
    result = Section.restore
    render :text => result.join("<br/>")
  end

  def restore_snippets
    result = Snippet.restore
    render :text => result.join("<br/>")
  end

  def dump_pages
    #result = YAML.dump(Page.all)
    result = Page.all.collect { |page|
      {:id=>page.id, :order=>page.order, :title=>page.title, :clue=>page.clue, :body=>page.body}
    }
    render :text => result.to_yaml
  end  

  def dump_sections
    #result = YAML.dump(Section.all)
    result = Section.all.collect { |section|
      {:id=>section.id, :order=>section.order, :title=>section.title, :clue=>section.clue}
    }
    render :text => result.to_yaml
  end

  def dump_snippets
    #result = YAML.dump(Snippet.all)
    result = Snippet.all.collect { |snippet|
      {:id=>snippet.id, :name=>snippet.name, :code=>snippet.code}
    }
    render :text => result.to_yaml
  end

  
  def dump_presentations
    #result = YAML.dump(Presentation.all)
    result = Presentation.all.collect { |presentation|
      {:id=>presentation.id, :title=>presentation.title, :speaker=>presentation.speaker, :conference=>presentation.conference}
    }
    render :text => result.to_yaml
  end
end
