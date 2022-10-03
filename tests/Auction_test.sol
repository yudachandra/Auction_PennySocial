// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../contracts/Auction.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite {
    Auction public auction;

    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'
    function beforeAll() public {
        // <instantiate contract>
        auction = new Auction(auction);
    }

    // function checkRegister() public {
    //     // Use 'Assert' methods: https://remix-ide.readthedocs.io/en/latest/assert_library.html
    //     auction.register();
    //     Assert.equal(auction.count(), 2, "Number of registant should be 1");
    // }

    // function checkBid() public {
    //     // Use 'Assert' methods: https://remix-ide.readthedocs.io/en/latest/assert_library.html
    //     auction.bid(3,0);
    //     Assert.equal(auction.count(), 2, "Number of registant should be 1");
    // }

    function checkSuccess2() public pure returns (bool) {
        // Use the return value (true or false) to test the contract
        return true;
    }
    
    // function checkFailure() public {
    // }

    /// Custom Transaction Context: https://remix-ide.readthedocs.io/en/latest/unittesting.html#customization
    /// #sender: account-1
    /// #value: 100
    function checkSenderAndValue() public payable {
        // account index varies 0-9, value is in wei
        Assert.equal(msg.sender, TestsAccounts.getAccount(1), "Invalid sender");
        Assert.equal(msg.value, 100, "Invalid value");
    }
}
    