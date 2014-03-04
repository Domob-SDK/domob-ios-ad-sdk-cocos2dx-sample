#include "HelloWorldScene.h"
#include "SimpleAudioEngine.h"

using namespace cocos2d;
using namespace CocosDenshion;

CCScene* HelloWorld::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    HelloWorld *layer = HelloWorld::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }
    
    CCSpriteFrameCache *cache = CCSpriteFrameCache::sharedSpriteFrameCache();
    cache->addSpriteFramesWithFile("images.plist", "images.png");
    
    CCTexture2D* texture = CCTextureCache::sharedTextureCache()->textureForKey("images.png");
    CCSpriteBatchNode* spriteBatch = CCSpriteBatchNode::createWithTexture(texture);
    addChild(spriteBatch);
    
    CCSize size = CCDirector::sharedDirector()->getWinSize();
    
    CCSprite* pSprite = CCSprite::createWithSpriteFrameName("Background.png");
    pSprite->setPosition(ccp(size.width/2, size.height/2));
    this->addChild(pSprite, 0);
    
    pSprite = CCSprite::createWithSpriteFrameName("Grass Block.png");
    pSprite->setPosition(ccp(size.width/2, size.height/2));
    this->addChild(pSprite, 0);
    
    pSprite = CCSprite::createWithSpriteFrameName("p8.png");
    CCSize dim = pSprite->getContentSize();
    pSprite->setPosition(ccp(size.width/2, size.height/2 + dim.height/2));
    this->addChild(pSprite);
    
      return true;
}

void HelloWorld::menuCloseCallback(CCObject* pSender)
{
    CCDirector::sharedDirector()->end();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
    exit(0);
#endif
}
