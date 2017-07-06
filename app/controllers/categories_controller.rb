class CategoriesController < ApplicationController

  def index
    @category = Category.all
    @automotive = @category[0]
    @beauty = @category[1]
    @technology = @category[2]
    @academic = @category[3]
    @art = @category[4]
    @photography = @category[5]
    @culinary = @category[6]
    @fashion = @category[7]
    @fitness = @category[8]
    @childcare = @category[9]
    @event_services = @category[10]
    @other = @category[11]

    @listing = Listing.all
    @hash = Gmaps4rails.build_markers(@listing) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
      marker.infowindow "<a target='blank' href='https://www.google.com/maps/place/"+"#{listing.full_address}"+">Get Directions With Google Maps</a>"
		  marker.json({ title: listing.title })
    end
  end

  def show
    @listings = Listing.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
    @category = Category.find(params[:id])
  end

end
