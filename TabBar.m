//
//  TabBar.m
//  ObjcToolKit
//
//  Created by MP02031 on 2020/09/07.
//  Copyright © 2020 yihyeoncheol. All rights reserved.
//

#import "TabBar.h"
#import "Button.h"
@implementation TabBarItem

- (void)dealloc {
    _title = nil;
    _image = nil;
    _selectedImage = nil;
    
    _name = nil;
    _userInfo = nil;
//    _style = nil;
}

+ (TabBarItem*) itemWithTitle:(NSString*)title {
    TabBarItem *item = [TabBarItem new];
    item.title = title;
    return item;
}

+ (TabBarItem*) itemWithImage:(UIImage*)image selectedImage:(UIImage*)selectedImage {
    TabBarItem *item = [TabBarItem new];
    item.image = image;
    item.selectedImage = selectedImage;
    return item;
}

@end

@interface TabBar()



@end

@implementation TabBar

- (void)dealloc{
    NSArray *keys = @[@"items"];
    
    for (NSString *key in keys) {
        [self removeObserver:self forKeyPath:key];
    }
    _contentView = nil;
    _components = nil;
    _items = nil;
    _backgroundView = nil;
    _accessoryView = nil;
}

- (void)initial {
    
    [super initial];
    _itemMaximum = 5;
    _spacing = 15;
    _contentMode = TabItemFill;
    _contentEdgeInsets = UIEdgeInsetsZero;
    _itemEdgeInsets = UIEdgeInsetsZero;
    _components = [[NSMutableArray alloc]init];
    _backgroundView = [[View alloc]init];
    _backgroundView.backgroundColor = [UIColor clearColor];
    [self addSubview:_backgroundView];
    _contentView = [[ScrollView alloc]init];
    _contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:_contentView];
    
    _accessoryView = [self createAccessoryView];
    [_contentView addSubview:_accessoryView];
    _useAccessoryView = NO;
//    _accessoryView.hidden = YES;
    NSArray *keys = @[@"items", ];
    for (NSString *key in keys) {
        [self addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew context:nil];
    }
    #if !TARGET_INTERFACE_BUILDER
    // connect to the server
    #else
        self.items = @[[TabBarItem itemWithTitle:@"TabBar"]];
    #endif
}

- (UIView *)createAccessoryView {
    return [[UIView alloc]init];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.frame = UIEdgeInsetsInsetRect(self.bounds, _contentEdgeInsets);
    self.backgroundView.frame = self.bounds;
    [self update];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object  change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"items"]) {
        [self paint];
        [self update];
    }
}
- (void)setContentInset:(UIEdgeInsets)contentInset {
    _contentInset = contentInset;
    _contentView.contentInset = contentInset;
}
- (void)setUseAccessoryView:(BOOL)useAccessoryView {
    _useAccessoryView = useAccessoryView;
    _accessoryView.hidden = !useAccessoryView;
}

- (void)itemSelect:(Button*)button {
    NSInteger index = button.tag;
    if(_selectedIndex == index){
        return;
    };

    [self setSelectedIndex:index];
//    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)setContentMode:(TabItemContentMode)contentMode {
    _contentMode = contentMode;
    [self update];
}

- (Button*)indexforTabBarButton:(NSInteger)index{
    return [_components objectAtIndex:index];
}


- (void)setSelectedIndex:(NSInteger)selectedIndex {
    
    for (UIButton *item in _components) {
        item.selected = NO;
    }
    
    UIButton *tapButton = [_components objectAtIndex:selectedIndex];
    tapButton.selected = YES;
    
    
    
    
    if (_selectedIndex == selectedIndex){
    }else {
        _selectedIndex = selectedIndex;
        _accessoryView.frame = [self accessoryViewRect:tapButton.frame];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }    
}


// 여기서 그리자. paint
- (void)paint {
    
    NSInteger tagIndex = 0;
    
    
    for (UIView *subview in _components) {
        [subview removeFromSuperview];
    }
    
    [_components removeAllObjects];
    
    for (TabBarItem* item in _items) {
        Button *button = [Button buttonWithType:UIButtonTypeCustom];
        button.title = item.title;
        button.tag = tagIndex;

        
        [button addTarget:self action:@selector(itemSelect:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:item.image forState:UIControlStateNormal];
        [button setImage:item.selectedImage forState:UIControlStateSelected];
        
        [_contentView addSubview:button];
        [_components addObject:button];
        
        
        
        tagIndex ++;
    }
    
    [_contentView bringSubviewToFront:_accessoryView];
    
    [self setNeedsStyle];
    
    [self setSelectedIndex:_selectedIndex];
    
    
}

- (void)update {
    
    CGRect itemRect = CGRectZero;
    CGFloat width = self.contentView.bounds.size.width / MIN(self.items.count, _itemMaximum);
//    CGFloat height = self.contentView.bounds.size.height / MIN(self.items.count, _itemMaximum);
    
    itemRect.origin.x = fabs(_itemEdgeInsets.left);
    itemRect.size.width = width;
    itemRect.size.height = self.contentView.bounds.size.height;
    
    
    
    for(Button *tabbutton in _components) {
        if (_contentMode == TabItemFit){
            [tabbutton sizeToFit];
            CGRect f = tabbutton.frame;
            f.origin.x = itemRect.origin.x;
            f.size.height = itemRect.size.height;
            f = UIEdgeInsetsInsetRect(f, _itemEdgeInsets);
            tabbutton.frame = f;
            
            itemRect.origin.x += f.size.width + _spacing;
            
        }else{
            tabbutton.frame = itemRect;
            itemRect.origin.x += width;
        }
    }
    
    if (_components.count > 0){
        UIButton *tapButton = [_components objectAtIndex:_selectedIndex];
        tapButton.selected = YES;
        _accessoryView.frame = [self accessoryViewRect:tapButton.frame];
    }
    
    self.contentView.contentSize = CGSizeMake(CGRectGetMinX(itemRect), self.contentView.bounds.size.height);
}


- (CGRect)accessoryViewRect:(CGRect)contentRect {
    CGRect slice;
    CGRect remainder;
    CGRectDivide(contentRect, &slice, &remainder, 3, CGRectMaxYEdge);
//    slice.origin.y = 0;
     
    CGRect accessoryViewRect = UIEdgeInsetsInsetRect(slice, UIEdgeInsetsZero);
    return accessoryViewRect;
}


@end
