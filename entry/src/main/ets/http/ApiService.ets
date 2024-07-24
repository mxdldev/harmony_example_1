import axios from '@ohos/axios';
import { HomeModel } from './entity/HomeModel'

class ApiService {
  baseUrl = 'https://baobab.kaiyanapp.com/api/v2/feed';

  async getHomeList(date: string): Promise<HomeModel> {
    try {
      const response = await axios.get<HomeModel>(this.baseUrl, {
        params: { date },
        headers: {
          'Content-Type': 'application/json'
        }
      });

      if (response.status === 200) {
        return response.data;
      } else {
        console.log('请求失败', response);
        throw new Error('请求失败');
      }
    } catch (error) {
      console.error('请求异常', error);
      throw error;
    }
  }
}

const apiService = new ApiService();

export default apiService;
