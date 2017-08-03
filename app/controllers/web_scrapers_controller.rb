class WebScrapersController < ApplicationController
	def index
		@web_scrapes = WebScrape.all
	end

	def new
		@web_scrape = WebScrape.new
	end

	def create
		split_urls = params[:web_scrape][:url].gsub(/\s+/, "").split(',')
		split_urls.each do |url|
			make_valid_url(url)
		end
		redirect_to web_scrapers_path
	end

	def destroy
		@web_scrape = WebScrape.find(params[:id])
		@web_scrape.destroy

		redirect_to web_scrapers_path
	end

	private

		def make_valid_url(url)
			u = URI.parse(url)
			if(%w{http https}.include?(u.scheme))
				get_infromation_from_url(url)
			else
				url.insert(0, 'http://')
			    get_infromation_from_url(url)
			end
		end

		def get_infromation_from_url(url)
			doc = Pismo::Document.new(url)
			title = doc.title.present? ? doc.title : "Invalid URL"
			favicon = doc.favicon.present? ? doc.favicon : "Invalid URL"
			WebScrape.create(url: url, title: title, avatar: favicon )
		end
			

end
