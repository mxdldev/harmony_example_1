import apiService from '../../http/ApiService'
import { HomeModel } from '../../http/entity/HomeModel'
import { LogUtils } from '../../utils/LogUtils'

@Component
export struct HomePage {
  @State homeData: HomeModel | null = null;

  aboutToAppear() {
    apiService.getHomeList('')
      .then(data => {
        this.homeData = data;
        console.info("HomeModel:", this.homeData.nextPublishTime);
        console.info("HomeModel:", this.homeData.nextPageUrl);
        console.info("HomeModel:", this.homeData.issueList[0].type);
        const jsonString = JSON.stringify(this.homeData);
        LogUtils.console(jsonString)

      })
      .catch(error => {
        console.error('请求失败', error);
      });
  }

  build() {
    Column() {
      Text('HolloWord').width('50vp').height('50vp').fontColor('#ff0000').fontSize('30fp')
    }.width('100%').height('100%')

  }
}
