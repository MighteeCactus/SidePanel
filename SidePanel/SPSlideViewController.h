//
//  SPSlideViewController.h
//  SidePanel
//
//  Created by Alexander Bykov on 10/9/13.
//  Copyright (c) 2013 Alexander Bykov. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Класс втоматически добавляет слайдер справа от view, к контроллеру которого был добавлен.
 Конфигурация настраиваемых параметров проводится в [self configureSlider]
 */
@interface SPSlideViewController : UIViewController

/**
 Показывает показан ли слайдер в настоящий момент
 */
@property (nonatomic, readonly, getter=isSlidedOut) BOOL slidedOut;
/**
 Перемещать ли navigationBar вместе с родительским view
 */
@property (nonatomic, getter=isNavigationBarStickedToParent) BOOL stickNavigationBarToParent;
/**
 Определяет ширину показанного слайдера, относительно его полной ширины self.view
 */
@property (nonatomic) CGFloat persentageSlideDistance;


/**
 Действие для показа или скрытия слайдера
 */
- (void)toggleSlide;

/**
 Метод вызывается во время awakeFromNib/initWithNibName, до вызова viewDidLoad. Презназначен для начальной инициализации слайдера.
 */
- (void)configureSlider;
@end
