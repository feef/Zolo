// Generated by Apple Swift version 3.0.2 (swiftlang-800.0.63 clang-800.0.42.1)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import ObjectiveC;
@import CoreGraphics;
@import Foundation;
@import SDWebImage;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;

SWIFT_CLASS("_TtC4Zolo11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4Zolo15KeyboardManager")
@interface KeyboardManager : NSObject
@property (nonatomic, copy) void (^ _Nullable onShow)(CGRect);
@property (nonatomic, copy) void (^ _Nullable onHide)(CGRect);
@property (nonatomic, copy) void (^ _Nullable onChangeFrame)(CGRect);
- (nonnull instancetype)initOnShow:(void (^ _Nullable)(CGRect))onShow onHide:(void (^ _Nullable)(CGRect))onHide onChangeFrame:(void (^ _Nullable)(CGRect))onChangeFrame OBJC_DESIGNATED_INITIALIZER;
- (void)willShowWithNotification:(NSNotification * _Nonnull)notification;
- (void)willHideWithNotification:(NSNotification * _Nonnull)notification;
- (void)willChangeFrameWithNotification:(NSNotification * _Nonnull)notification;
- (void)getFrameFrom:(NSNotification * _Nonnull)notification andCall:(void (^ _Nullable)(CGRect))method;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


@interface NSOperationQueue (SWIFT_EXTENSION(Zolo))
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) NSOperationQueue * _Nonnull background;)
+ (NSOperationQueue * _Nonnull)background;
@end

@class NSCoder;

SWIFT_CLASS("_TtC4Zolo12SourceButton")
@interface SourceButton : UIButton
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImage;

@interface UIImageView (SWIFT_EXTENSION(Zolo))
- (void)setImageWith:(NSURL * _Nonnull)url completed:(SDExternalCompletionBlock _Nullable)completed;
@end


@interface UIView (SWIFT_EXTENSION(Zolo))
- (void)removeAllSubviews;
@end

@class UITableView;
@class UISearchBar;
@class UITableViewCell;

SWIFT_CLASS("_TtC4Zolo25WatchableSearchController")
@interface WatchableSearchController : NSObject <UISearchBarDelegate, UITableViewDataSource>
- (nonnull instancetype)init:(UITableView * _Nonnull)tableView :(UISearchBar * _Nonnull)searchBar OBJC_DESIGNATED_INITIALIZER;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)searchBar:(UISearchBar * _Nonnull)searchBar textDidChange:(NSString * _Nonnull)searchText;
- (void)searchBarSearchButtonClicked:(UISearchBar * _Nonnull)searchBar;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end

@class UIScrollView;
@class NSBundle;

SWIFT_CLASS("_TtC4Zolo29WatchableSearchViewController")
@interface WatchableSearchViewController : UIViewController <UIScrollViewDelegate>
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (void)keyboardUpdatedTo:(CGRect)frame;
@property (nonatomic, readonly) UIStatusBarStyle preferredStatusBarStyle;
- (void)scrollViewDidScroll:(UIScrollView * _Nonnull)scrollView;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UINib;
@class UILabel;

SWIFT_CLASS("_TtC4Zolo22WatchableTableViewCell")
@interface WatchableTableViewCell : UITableViewCell
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull reuseIdentifier;)
+ (NSString * _Nonnull)reuseIdentifier;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) UINib * _Nonnull associatedNib;)
+ (UINib * _Nonnull)associatedNib;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly) CGFloat preferredHeight;)
+ (CGFloat)preferredHeight;
@property (nonatomic, strong) IBOutlet UIImageView * _Null_unspecified posterImageView;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified titleLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified yearLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified descriptionLabel;
@property (nonatomic, strong) IBOutlet UIScrollView * _Null_unspecified linksScrollView;
@property (nonatomic, copy) NSArray<SourceButton *> * _Nonnull sourceButtons;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
