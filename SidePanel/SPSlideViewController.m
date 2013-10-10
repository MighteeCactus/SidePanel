//
//  SPSlideViewController.m
//  SidePanel
//
//  Created by Alexander Bykov on 10/9/13.
//  Copyright (c) 2013 Alexander Bykov. All rights reserved.
//

#import "SPSlideViewController.h"

@interface SPSlideViewController ()

@property (nonatomic, readwrite, getter=isSlidedOut) BOOL slidedOut;

@end

@implementation SPSlideViewController

/**
 Начальная инииализация для контроллера, до добавления view
 */
- (void)setup
{
    // some initialization code
    _persentageSlideDistance = 0.98f;
    
    [self configureSlider];
}

// тут кастомная инициализация параметров
- (void)configureSlider
{
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    
    return self;
}

/**
 Добавляет свой view в родительский
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.parentViewController.view addSubview:self.view];
}

/**
 Обновляет расположение слайдера при первом показе
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.isNavigationBarStickedToParent) {
        [self.parentViewController.view insertSubview:self.parentViewController.navigationController.navigationBar atIndex:0];
    }

    [self disposeView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (self.isNavigationBarStickedToParent) {
        [self.parentViewController.navigationController.view insertSubview:self.parentViewController.navigationController.navigationBar atIndex:1];
    }
}


/**
 При смене ориентации перемещаем слайдер в нужное место
 */
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self disposeView];
}

/**
 Перемещаем view.frame слайдера в его начальную позицию внутри родительского слайдера
 */
- (void)disposeView
{
    UIView * parentView = self.parentViewController.view;
    
    // если наши view еще не были подготовлены для показа, то ничего не делаем
    if (CGRectEqualToRect(parentView.frame, CGRectZero) || CGRectEqualToRect(self.view.frame, CGRectZero)) {
        return;
    }
    
    CGPoint rightCenter = self.view.center;
    rightCenter = CGPointMake((parentView.center.x * 2 + self.view.bounds.size.width / 2), rightCenter.y);
    self.view.center = rightCenter;
}

/**
 Перемещет bounds родительского объекта(меняет x и y координаты) в зависмости от self.slidedOut
 */
- (void)moveParentViewBounds
{
    UIView * parentView = self.parentViewController.view;
    
    CGFloat slideDistance = self.view.frame.size.width * self.persentageSlideDistance;
    slideDistance = self.isSlidedOut ? -slideDistance : slideDistance;
    
    CGRect mainBounds = parentView.bounds;
    mainBounds = CGRectOffset(mainBounds, slideDistance, 0);
    parentView.bounds = mainBounds;
    
    self.slidedOut = !self.isSlidedOut;
    
    if (self.isSlidedOut) {
        [parentView bringSubviewToFront:self.view];
    }
}

- (void)toggleSlide
{
    [self moveParentViewBounds];
}

/**
 Сеттер. Значение по умолчанию 98%, ставится в [self setup]
 */
- (void)setPersentageSlideDistance:(CGFloat)persentageSlideDistance
{
    _persentageSlideDistance = persentageSlideDistance;
    
    [self disposeView];
}


@end
