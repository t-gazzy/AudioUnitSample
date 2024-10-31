//
//  AudioUnitHandler.m
//  AudioUnitSample
//
//  Created by takemasa kaji on 2024/10/31.
//

#import <Foundation/Foundation.h>
#import <AudioUnit/AudioUnit.h>
#import "AudioUnitHandler.h"

@interface AudioUnitHandler() {
    AudioUnit* unit_;
}
@end

@implementation AudioUnitHandler

-(id _Nonnull)init {
    return self;
}

-(bool)prepare {
    AudioComponentDescription desc;
    desc.componentType = kAudioUnitType_Output;
    desc.componentSubType = kAudioUnitSubType_VoiceProcessingIO;
    desc.componentManufacturer = kAudioUnitManufacturer_Apple;
    desc.componentFlags = 0;
    desc.componentFlagsMask = 0;
    
    AudioComponent comp = AudioComponentFindNext(nil, &desc);
    
    OSStatus result = AudioComponentInstanceNew(comp, unit_);
    if (result == noErr) {
        NSLog(@"failed to create audiounit instance");
        return false;
    }
    
    return true;
}

@end
