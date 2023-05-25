// @flow
import react_native_1, { NativeModules, NativeEventEmitter } from 'react-native'
import type { Location } from '../types'

const { BaiduMapLocation } = NativeModules
const eventEmitter = new NativeEventEmitter(BaiduMapLocation)

type Options = {
  gps: boolean,
  distanceFilter: number,
}

type Listener = (listener: {
  timestamp: number,
  altitude: number,
  speed: number,
} & Location) => {}

export default {
  init(key) : Promise<void> {
    if (BaiduMapLocation.init) {
      return BaiduMapLocation.init(react_native_1.Platform.select(key))
    }

    return Promise.resolve()
  },
  start: () => BaiduMapLocation.start(),
  stop: () => BaiduMapLocation.stop(),
  setOptions: (options) => BaiduMapLocation.setOptions(options),
  addLocationListener: (listener) => eventEmitter.addListener('baiduMapLocation', listener),
}
