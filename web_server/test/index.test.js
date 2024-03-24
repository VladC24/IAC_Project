const axios = require('axios');
const { getData } = require('../src/index');

jest.mock('axios');

describe('getData', () => {
  it('should make a GET request to http://localhost:3001/data', async () => {
    await getData();
    expect(axios.get).toHaveBeenCalledWith('http://localhost:3001/data');
  });

  it('should return the response data', async () => {
    const responseData = { data: 'example data' };
    axios.get.mockResolvedValue(responseData);

    const result = await getData();
    expect(result).toEqual(responseData.data);
  });

  it('should throw an error if the request fails', async () => {
    const errorMessage = 'Request failed';
    axios.get.mockRejectedValue(new Error(errorMessage));

    await expect(getData()).rejects.toThrow(errorMessage);
  });
});