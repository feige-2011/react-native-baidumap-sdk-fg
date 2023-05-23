#import <React/RCTEventEmitter.h>
#import <BMKLocationkit/BMKLocationComponent.h>
#import <BaiduMapAPI_Base/BMKUserLocation.h>
#import "RCTUserLocation.h"

@interface RCTLocationModule : RCTEventEmitter <RCTBridgeModule, BMKLocationManagerDelegate>
@end

@implementation RCTLocationModule {
    BMKLocationManager *_locationManager;
    RCTUserLocation *_location;
    BOOL _initialized;
}

RCT_EXPORT_MODULE(BaiduMapLocation)

RCT_EXPORT_METHOD(setOptions:(NSDictionary *)options) {
    if (options[@"distanceFilter"]) {
        _locationManager.distanceFilter = [options[@"distanceFilter"] doubleValue];
    }
}

RCT_REMAP_METHOD(init, resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    if (!_initialized) {
        _initialized = YES;
        _location = [RCTUserLocation new];
        dispatch_async(dispatch_get_main_queue(), ^{
            //初始化实例
            self->_locationManager = [[BMKLocationManager alloc] init];
            self->_locationManager.delegate = self;
            //设置预期精度参数
            self->_locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            //设置是否自动停止位置更新
            self->_locationManager.pausesLocationUpdatesAutomatically = NO;
            //设置是否允许后台定位
            self->_locationManager.allowsBackgroundLocationUpdates = YES;
            //设置位置获取超时时间
            self->_locationManager.locationTimeout = 10;
            //设置获取地址信息超时时间
            self->_locationManager.reGeocodeTimeout = 10;
            resolve(nil);
        });
    } else {
        resolve(nil);
    }
}

RCT_EXPORT_METHOD(start) {
    [_locationManager setLocatingWithReGeocode:YES];
    [_locationManager startUpdatingLocation];
}

RCT_EXPORT_METHOD(stop) {
    [_locationManager stopUpdatingLocation];
}

- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didUpdateLocation:(BMKLocation * _Nullable)location orError:(NSError * _Nullable)error

{
    if (error)
    {
        NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
    } if (location) {//得到定位信息，添加annotation
        [self sendEventWithName:@"baiduMapLocation" body: _location.json];
                if (location.location) {
                    NSLog(@"LOC = %@",location.location);
                }
                if (location.rgcData) {
                    NSLog(@"rgc = %@",[location.rgcData description]);
                }
                
                if (location.rgcData.poiList) {
                    for (BMKLocationPoi * poi in location.rgcData.poiList) {
                        NSLog(@"poi = %@, %@, %f, %@, %@", poi.name, poi.addr, poi.relaiability, poi.tags, poi.uid);
                    }
                }
                
                if (location.rgcData.poiRegion) {
                    NSLog(@"poiregion = %@, %@, %@", location.rgcData.poiRegion.name, location.rgcData.poiRegion.tags, location.rgcData.poiRegion.directionDesc);
                }

            }
}

//sdk重写前
//- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
//    [_location updateWithCLLocation:userLocation.location];
//    [self sendEventWithName:@"baiduMapLocation" body: _location.json];
//}

- (NSArray<NSString *> *)supportedEvents {
    return @[@"baiduMapLocation"];
}

@end
