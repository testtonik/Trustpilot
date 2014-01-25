@api
Feature: call to http://api2.segment.io/v1/i
  Testing a REST Web Service

Scenario: Make a REST call
  When I post to "/v1/i" with:
    """
   {"sessionId":"16308cf2d659187f","userId":"2c54d779d2c364838ce33f92084e3333b85cd7a7","traits":{"name":"Tom Jonson","email":"testtonik@gmail.com","created":"2014-01-24T15:48:58.000Z","FacebookUserId":100007430733930,"Birth Year":1971,"Gender":"Unknown","id":"2c54d779d2c364838ce33f92084e3333b85cd7a7"},"context":{"language":"en-US","library":"segment.js"},"apiKey":"8tb69qtawc","callbackId":831}
     """

  Then the response should be JSON:
      """
      {"success":true,
      "callbackId":831}
      """