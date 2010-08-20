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

end
