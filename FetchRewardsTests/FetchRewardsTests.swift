//
//  FetchRewardsTests.swift
//  FetchRewardsTests
//
//  Created by Tatsuya Moriguchi on 10/1/21.
//  Copyright © 2021 Tatsuya Moriguchi. All rights reserved.
//

import XCTest
@testable import FetchRewards

class FetchRewardsTests: XCTestCase {

    var sut: Categories!
    var url: URL!
    var localCategories = [Category]()
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        let data = try getData(fromJSON: "Categories")
        
        sut = try JSONDecoder().decode(Categories.self, from: data)
        localCategories = sut.categories
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
        
    }

    func testCategoriesCount() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        
        XCTAssertEqual(localCategories.count, 14)
        //XCTAssertEqual(localCategories.count, 10)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    


  
    

            
}

extension XCTestCase {
    enum TestError: Error {
        case fileNotFound
    }
    
    func getData(fromJSON fileName: String) throws -> Data {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing File: \(fileName).json")
            throw TestError.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw error
        }
    }
}



