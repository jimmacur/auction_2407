class Auction
    attr_reader :items, :bidders
    def initialize
        @items = []
        @bidders = []
    end

    def add_item(item)
        @items << item
    end

    def item_names
        items.map { |item| item.name }
    end

    def unpopular_items
        @items.select { |item| item.bids.empty? }
    end

    def potential_revenue
        revenue = @items.map do |item| 
            item.current_high_bid
        end
        revenue.compact.sum
    end

    def add_bidder(attendee)
        @bidders << attendee.name
    end

    def bidders_info
        bidders_info = {}
    
        @items.each do |item|
            item.bids.each do |attendee, bid|
            bidders_info[attendee] ||= { budget: attendee.budget, items: [] }
            bidders_info[attendee][:items] << item.name
            end
        end
        bidders_info      
    end  
end