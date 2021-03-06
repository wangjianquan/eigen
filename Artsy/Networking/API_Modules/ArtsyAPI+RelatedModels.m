#import "Artist.h"
#import "Artwork.h"
#import "Gene.h"
#import "ArtsyAPI+Private.h"
#import "ARPostFeedItem.h"
#import "ARRouter.h"


@implementation ArtsyAPI (RelatedModels)

+ (AFHTTPRequestOperation *)getRelatedArtistsForArtist:(Artist *)artist
                                             excluding:(NSArray *)artistsToExclude
                                               success:(void (^)(NSArray *artists))success
                                               failure:(void (^)(NSError *error))failure
{
    NSURLRequest *request = [ARRouter newArtistsRelatedToArtistRequest:artist excluding:artistsToExclude];
    return [self getRequest:request parseIntoAnArrayOfClass:[Artist class] success:success failure:failure];
}

+ (AFHTTPRequestOperation *)getRelatedArtistForArtist:(Artist *)artist
                                            excluding:(NSArray *)artistsToExclude
                                              success:(void (^)(NSArray *relatedArtist))success
                                              failure:(void (^)(NSError *error))failure
{
    NSURLRequest *request = [ARRouter newArtistRelatedToArtistRequest:artist excluding:artistsToExclude];
    return [self getRequest:request parseIntoAnArrayOfClass:[Artist class] success:success failure:failure];
}

+ (AFHTTPRequestOperation *)getRelatedGenesForGene:(Gene *)gene
                                         excluding:(NSArray *)genesToExclude
                                           success:(void (^)(NSArray *genes))success
                                           failure:(void (^)(NSError *error))failure
{
    NSURLRequest *request = [ARRouter newGenesRelatedToGeneRequest:gene excluding:genesToExclude];
    return [self getRequest:request parseIntoAnArrayOfClass:[Gene class] success:success failure:failure];
}

+ (AFHTTPRequestOperation *)getRelatedGeneForGene:(Gene *)gene
                                        excluding:(NSArray *)genesToExclude
                                          success:(void (^)(NSArray *relatedGene))success
                                          failure:(void (^)(NSError *error))failure
{
    NSURLRequest *request = [ARRouter newGeneRelatedToGeneRequest:gene excluding:genesToExclude];
    return [self getRequest:request parseIntoAnArrayOfClass:[Gene class] success:success failure:failure];
}


+ (AFHTTPRequestOperation *)getPopularArtistsWithSuccess:(void (^)(NSArray *artists))success
                                                 failure:(void (^)(NSError *error))failure
{
    NSURLRequest *request = [ARRouter newArtistsPopularRequest];
    return [self getRequest:request parseIntoAnArrayOfClass:[Artist class] withKey:nil success:success failure:failure];
}

+ (AFHTTPRequestOperation *)getPopularArtistsFallbackWithSuccess:(void (^)(NSArray *artists))success
                                                 failure:(void (^)(NSError *error))failure
{
    NSURLRequest *request = [ARRouter newArtistsPopularRequestFallback];
    return [self getRequest:request parseIntoAnArrayOfClass:[Artist class] withKey:nil success:success failure:failure];
}

+ (AFHTTPRequestOperation *)getPopularGenesWithSuccess:(void (^)(NSArray *genes))success
                                               failure:(void (^)(NSError *error))failure
{
    NSURLRequest *request = [ARRouter newGenesPopularRequest];
    return [self getRequest:request parseIntoAnArrayOfClass:[Gene class] success:success failure:failure];
}

+ (AFHTTPRequestOperation *)getRelatedArtworksForArtwork:(Artwork *)artwork
                                                 success:(void (^)(NSArray *artworks))success
                                                 failure:(void (^)(NSError *error))failure
{
    NSURLRequest *request = [ARRouter newArtworksRelatedToArtworkRequest:artwork];
    return [self getRequest:request parseIntoAnArrayOfClass:[Artwork class] success:success failure:failure];
}

+ (AFHTTPRequestOperation *)getRelatedArtworksForArtwork:(Artwork *)artwork
                                                  inFair:(Fair *)fair
                                                 success:(void (^)(NSArray *))success
                                                 failure:(void (^)(NSError *))failure
{
    NSURLRequest *request = [ARRouter newArtworksRelatedToArtwork:artwork inFairRequest:fair];
    return [self getRequest:request parseIntoAnArrayOfClass:[Artwork class] success:success failure:failure];
}

+ (AFHTTPRequestOperation *)getRelatedPostsForArtwork:(Artwork *)artwork
                                              success:(void (^)(NSArray *posts))success
                                              failure:(void (^)(NSError *error))failure
{
    NSURLRequest *request = [ARRouter newPostsRelatedToArtwork:artwork];
    return [self getRequest:request parseIntoAnArrayOfClass:[ARPostFeedItem class] success:success failure:failure];
}

+ (AFHTTPRequestOperation *)getRelatedPostsForArtist:(Artist *)artist
                                             success:(void (^)(NSArray *posts))success
                                             failure:(void (^)(NSError *error))failure
{
    NSURLRequest *request = [ARRouter newPostsRelatedToArtist:artist];
    return [self getRequest:request parseIntoAnArrayOfClass:[ARPostFeedItem class] success:success failure:failure];
}

@end
