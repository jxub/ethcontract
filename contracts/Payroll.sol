pragma solidity ^0.4.4;

import './PayrollInterface.sol';


// TODO: fix initialyearly salary to yearly in places
contract Payroll is PayrollInterface {
    address public owner;
    uint256 totalFunds;
    uint256 employeeCount;
    // for quickly retrieving the employee address by id or the employee number
    mapping (uint256 => Employee) employees;

    function Payroll() {
        owner = msg.sender;
        employeeCount = 0;
        totalFunds = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function destroy() onlyOwner {
        selfdestruct(owner);
    }

    modifier onlyEmployee() {
        require(1 == 1);
        _;
    }

    struct Employee {
        address accountAddress;
        address[] allowedTokens;
        uint256 yearlyUSDSalary;
        bool isActive;
    }
    
    function addEmployee(
        address _accountAddress, 
        address[] _allowedTokens,
        uint256 _initialYearlyUSDSalary)
        onlyOwner
    {
        employees[employeeCount + 1] = Employee({
            accountAddress: _accountAddress,
            allowedTokens: _allowedTokens,
            yearlyUSDSalary: _initialYearlyUSDSalary,
            isActive: true
        });
    }

    function setEmployeeSalary(
        uint256 _employeeId,
        uint256 _yearlyUSDSalary)
        onlyOwner
    {
        employees[_employeeId].yearlyUSDSalary = _yearlyUSDSalary;
    }

    function removeEmployee(uint256 employeeId) onlyOwner {
        employees[employeeId].isActive = false;
    }
    
    function getEmployeeCount() constant returns (uint256) {
        return employeeCount;
    }

    function getEmployee(uint256 employeeId) constant returns (address a, address[] t, uint256 s, bool i) {
        a = employees[employeeId].accountAddress;
        t = employees[employeeId].allowedTokens;
        s = employees[employeeId].yearlyUSDSalary;
        i = employees[employeeId].isActive;
    }

    function calculatePayrollBurnrate() constant returns (uint256) {
        uint256 monthlySalaries;
        for (uint256 i = 1; i < employeeCount; i++) {
            monthlySalaries += employees[i].yearlyUSDSalary; // change from initial
        }
        return monthlySalaries;
    }

    function calculatePayrollRunway() constant returns (uint256) {
        uint265 daysOfRunway = totalFunds;
        for 
    }
}