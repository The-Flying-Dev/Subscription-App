class PublicationsController < ApplicationController
    def index 
        @publications = Publication.all
    end

    def show
        @publication = Publication.find(params[:id])
    end

    private
    def publication_params
      params.require(:publication).permit(:title,:description)
    end
end