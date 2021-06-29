import Quick
import Nimble
import GuildedRoseLLC

class RemoteItemRepositorySpec : QuickSpec {
    
    override func spec() {
        
        describe("init"){
            it("defaults to the staging API url") {
                let expectedURL = RemoteItemRepository.stagingAPI
                
                let repository = RemoteItemRepository()
                
                expect(repository.url).to(equal(expectedURL))
            }
            
            it("sets the url to a given string") {
                let expectedURL = "https://www.foo.com"
                
                let repository = RemoteItemRepository()
                repository.setURL(url: expectedURL)
                
                expect(repository.url).to(equal(expectedURL))
            }
        }
    }
}
