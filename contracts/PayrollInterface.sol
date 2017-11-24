pragma solidity ^0.4.4;

// For the sake of simplicity lets assume USD is a ERC20 token
// Also lets assume we can 100% trust the exchange rate oracle
contract PayrollInterface {
  /*
  /* OWNER ONLY */ // OK
  function addEmployee(address accountAddress, address[] allowedTokens, uint256 initialYearlyUSDSalary); // OK
  function setEmployeeSalary(uint256 employeeId, uint256 yearlyUSDSalary); // OK
  function removeEmployee(uint256 employeeId); // OK

  function addFunds(); // payable;
  function scapeHatch();
  // functi on addTokenFunds()? // Use approveAndCall or ERC223 tokenFallback

  function getEmployeeCount() constant returns (uint256); // OK
  function getEmployee(uint256 employeeId) constant returns (address employee, address[] allowedTokens, uint256 yearlyUSDSalary, bool isActive); // Return all important info too // OK

  function calculatePayrollBurnrate() constant returns (uint256); // Monthly usd amount spent in salaries
  function calculatePayrollRunway() constant returns (uint256); // Days until the contract can run out of funds

  /* EMPLOYEE ONLY */
  function determineAllocation(address[] tokens, uint256[] distribution); // only callable once every 6 months
  function payday(); // only callable once a month

  /* ORACLE ONLY */
  function setExchangeRate(address token, uint256 usdExchangeRate); // uses decimals from token
}